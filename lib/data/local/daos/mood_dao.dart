import 'package:drift/drift.dart';
import 'package:life_tracker/data/local/database.dart';
import 'package:life_tracker/data/local/tables/mood_entries.dart';

part 'mood_dao.g.dart';

/// DAO for mood entries operations
@DriftAccessor(tables: [MoodEntries])
class MoodDao extends DatabaseAccessor<AppDatabase> with _$MoodDaoMixin {
  MoodDao(AppDatabase db) : super(db);

  /// Get all mood entries
  Future<List<MoodEntryData>> getAllMoodEntries() {
    return (select(moodEntries)..orderBy([(m) => OrderingTerm.desc(m.date)]))
        .get();
  }

  /// Get mood entries for a specific date
  Future<List<MoodEntryData>> getMoodEntriesForDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(moodEntries)
          ..where((m) =>
              m.date.isBiggerOrEqualValue(startOfDay) &
              m.date.isSmallerThanValue(endOfDay))
          ..orderBy([(m) => OrderingTerm.desc(m.date)]))
        .get();
  }

  /// Get mood entries for a date range
  Future<List<MoodEntryData>> getMoodEntriesInRange(
    DateTime startDate,
    DateTime endDate,
  ) {
    return (select(moodEntries)
          ..where((m) =>
              m.date.isBiggerOrEqualValue(startDate) &
              m.date.isSmallerOrEqualValue(endDate))
          ..orderBy([(m) => OrderingTerm.desc(m.date)]))
        .get();
  }

  /// Get a single mood entry by ID
  Future<MoodEntryData?> getMoodEntryById(String id) {
    return (select(moodEntries)..where((m) => m.id.equals(id)))
        .getSingleOrNull();
  }

  /// Get today's mood entry
  Future<MoodEntryData?> getTodayMoodEntry() async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(moodEntries)
          ..where((m) =>
              m.date.isBiggerOrEqualValue(startOfDay) &
              m.date.isSmallerThanValue(endOfDay))
          ..orderBy([(m) => OrderingTerm.desc(m.date)]))
        .getSingleOrNull();
  }

  /// Insert a new mood entry
  Future<int> insertMoodEntry(MoodEntriesCompanion entry) {
    return into(moodEntries).insert(entry);
  }

  /// Update an existing mood entry
  Future<bool> updateMoodEntry(MoodEntryData entry) {
    return update(moodEntries).replace(entry);
  }

  /// Delete a mood entry
  Future<int> deleteMoodEntry(String id) {
    return (delete(moodEntries)..where((m) => m.id.equals(id))).go();
  }

  /// Get average mood rating for a date range
  Future<double> getAverageMoodRating(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final entries = await getMoodEntriesInRange(startDate, endDate);
    if (entries.isEmpty) return 0.0;

    final sum = entries.fold(0, (sum, entry) => sum + entry.rating);
    return sum / entries.length;
  }

  /// Get mood entries by rating
  Future<List<MoodEntryData>> getMoodEntriesByRating(int rating) {
    return (select(moodEntries)
          ..where((m) => m.rating.equals(rating))
          ..orderBy([(m) => OrderingTerm.desc(m.date)]))
        .get();
  }

  /// Get entries that need syncing
  Future<List<MoodEntryData>> getUnsyncedEntries() {
    return (select(moodEntries)
          ..where((m) =>
              m.syncStatus.equals('local') | m.syncStatus.equals('pending')))
        .get();
  }

  /// Watch all mood entries (for real-time updates)
  Stream<List<MoodEntryData>> watchAllMoodEntries() {
    return (select(moodEntries)..orderBy([(m) => OrderingTerm.desc(m.date)]))
        .watch();
  }

  /// Watch mood entries for current week
  Stream<List<MoodEntryData>> watchWeekMoodEntries() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 7));

    return (select(moodEntries)
          ..where((m) =>
              m.date.isBiggerOrEqualValue(startOfWeek) &
              m.date.isSmallerThanValue(endOfWeek))
          ..orderBy([(m) => OrderingTerm.desc(m.date)]))
        .watch();
  }

  /// Watch today's mood entry
  Stream<MoodEntryData?> watchTodayMoodEntry() {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(moodEntries)
          ..where((m) =>
              m.date.isBiggerOrEqualValue(startOfDay) &
              m.date.isSmallerThanValue(endOfDay))
          ..orderBy([(m) => OrderingTerm.desc(m.date)]))
        .watchSingleOrNull();
  }
}
