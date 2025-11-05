import 'package:drift/drift.dart';
import 'package:life_tracker/data/local/database.dart';
import 'package:life_tracker/data/local/tables/goals.dart';

part 'goal_dao.g.dart';

/// DAO for goals operations
@DriftAccessor(tables: [Goals])
class GoalDao extends DatabaseAccessor<AppDatabase> with _$GoalDaoMixin {
  GoalDao(AppDatabase db) : super(db);

  /// Get all goals
  Future<List<GoalData>> getAllGoals() {
    return (select(goals)..orderBy([(g) => OrderingTerm.desc(g.createdAt)]))
        .get();
  }

  /// Get active goals (not completed)
  Future<List<GoalData>> getActiveGoals() {
    return (select(goals)
          ..where((g) => g.isCompleted.equals(false))
          ..orderBy([(g) => OrderingTerm.desc(g.createdAt)]))
        .get();
  }

  /// Get completed goals
  Future<List<GoalData>> getCompletedGoals() {
    return (select(goals)
          ..where((g) => g.isCompleted.equals(true))
          ..orderBy([(g) => OrderingTerm.desc(g.createdAt)]))
        .get();
  }

  /// Get goals by category
  Future<List<GoalData>> getGoalsByCategory(String category) {
    return (select(goals)
          ..where((g) => g.category.equals(category))
          ..orderBy([(g) => OrderingTerm.desc(g.createdAt)]))
        .get();
  }

  /// Get a single goal by ID
  Future<GoalData?> getGoalById(String id) {
    return (select(goals)..where((g) => g.id.equals(id))).getSingleOrNull();
  }

  /// Insert a new goal
  Future<int> insertGoal(GoalsCompanion goal) {
    return into(goals).insert(goal);
  }

  /// Update an existing goal
  Future<bool> updateGoal(GoalData goal) {
    return update(goals).replace(goal);
  }

  /// Update goal progress
  Future<int> updateGoalProgress(String id, double newValue) {
    return (update(goals)..where((g) => g.id.equals(id)))
        .write(GoalsCompanion(currentValue: Value(newValue)));
  }

  /// Mark goal as completed
  Future<int> markGoalCompleted(String id) {
    return (update(goals)..where((g) => g.id.equals(id)))
        .write(const GoalsCompanion(isCompleted: Value(true)));
  }

  /// Delete a goal
  Future<int> deleteGoal(String id) {
    return (delete(goals)..where((g) => g.id.equals(id))).go();
  }

  /// Get goals with upcoming deadlines (within next 7 days)
  Future<List<GoalData>> getGoalsWithUpcomingDeadlines() {
    final now = DateTime.now();
    final weekFromNow = now.add(const Duration(days: 7));

    return (select(goals)
          ..where((g) =>
              g.isCompleted.equals(false) &
              g.deadline.isNotNull() &
              g.deadline.isBiggerOrEqualValue(now) &
              g.deadline.isSmallerOrEqualValue(weekFromNow))
          ..orderBy([(g) => OrderingTerm.asc(g.deadline)]))
        .get();
  }

  /// Get overdue goals
  Future<List<GoalData>> getOverdueGoals() {
    final now = DateTime.now();

    return (select(goals)
          ..where((g) =>
              g.isCompleted.equals(false) &
              g.deadline.isNotNull() &
              g.deadline.isSmallerThanValue(now))
          ..orderBy([(g) => OrderingTerm.asc(g.deadline)]))
        .get();
  }

  /// Get entries that need syncing
  Future<List<GoalData>> getUnsyncedGoals() {
    return (select(goals)
          ..where(
              (g) => g.syncStatus.equals('local') | g.syncStatus.equals('pending')))
        .get();
  }

  /// Watch all goals (for real-time updates)
  Stream<List<GoalData>> watchAllGoals() {
    return (select(goals)..orderBy([(g) => OrderingTerm.desc(g.createdAt)]))
        .watch();
  }

  /// Watch active goals
  Stream<List<GoalData>> watchActiveGoals() {
    return (select(goals)
          ..where((g) => g.isCompleted.equals(false))
          ..orderBy([(g) => OrderingTerm.desc(g.createdAt)]))
        .watch();
  }

  /// Watch a specific goal
  Stream<GoalData?> watchGoal(String id) {
    return (select(goals)..where((g) => g.id.equals(id))).watchSingleOrNull();
  }
}
