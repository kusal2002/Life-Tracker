import 'package:drift/drift.dart';
import 'package:life_tracker/data/local/database.dart';
import 'package:life_tracker/data/local/tables/time_entries.dart';

part 'time_entry_dao.g.dart';

/// DAO for time entries operations
@DriftAccessor(tables: [TimeEntries])
class TimeEntryDao extends DatabaseAccessor<AppDatabase>
    with _$TimeEntryDaoMixin {
  TimeEntryDao(AppDatabase db) : super(db);

  /// Get all time entries
  Future<List<TimeEntryData>> getAllTimeEntries() {
    return select(timeEntries).get();
  }

  /// Get time entries for a specific date
  Future<List<TimeEntryData>> getTimeEntriesForDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(timeEntries)
          ..where((t) =>
              t.startTime.isBiggerOrEqualValue(startOfDay) &
              t.startTime.isSmallerThanValue(endOfDay))
          ..orderBy([(t) => OrderingTerm.desc(t.startTime)]))
        .get();
  }

  /// Get time entries for a date range
  Future<List<TimeEntryData>> getTimeEntriesInRange(
    DateTime startDate,
    DateTime endDate,
  ) {
    return (select(timeEntries)
          ..where((t) =>
              t.startTime.isBiggerOrEqualValue(startDate) &
              t.startTime.isSmallerOrEqualValue(endDate))
          ..orderBy([(t) => OrderingTerm.desc(t.startTime)]))
        .get();
  }

  /// Get time entries by category
  Future<List<TimeEntryData>> getTimeEntriesByCategory(String category) {
    return (select(timeEntries)
          ..where((t) => t.category.equals(category))
          ..orderBy([(t) => OrderingTerm.desc(t.startTime)]))
        .get();
  }

  /// Get a single time entry by ID
  Future<TimeEntryData?> getTimeEntryById(String id) {
    return (select(timeEntries)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  /// Insert a new time entry
  Future<int> insertTimeEntry(TimeEntriesCompanion entry) {
    return into(timeEntries).insert(entry);
  }

  /// Update an existing time entry
  Future<bool> updateTimeEntry(TimeEntryData entry) {
    return update(timeEntries).replace(entry);
  }

  /// Delete a time entry
  Future<int> deleteTimeEntry(String id) {
    return (delete(timeEntries)..where((t) => t.id.equals(id))).go();
  }

  /// Get total duration for a category in a date range
  Future<int> getTotalDurationByCategory(
    String category,
    DateTime startDate,
    DateTime endDate,
  ) async {
    final entries = await (select(timeEntries)
          ..where((t) =>
              t.category.equals(category) &
              t.startTime.isBiggerOrEqualValue(startDate) &
              t.startTime.isSmallerOrEqualValue(endDate)))
        .get();

    return entries.fold<int>(0, (sum, entry) => sum + entry.durationSeconds);
  }

  /// Get entries that need syncing
  Future<List<TimeEntryData>> getUnsyncedEntries() {
    return (select(timeEntries)
          ..where((t) =>
              t.syncStatus.equals('local') | t.syncStatus.equals('pending')))
        .get();
  }

  /// Watch all time entries (for real-time updates)
  Stream<List<TimeEntryData>> watchAllTimeEntries() {
    return (select(timeEntries)
          ..orderBy([(t) => OrderingTerm.desc(t.startTime)]))
        .watch();
  }

  /// Watch time entries for today
  Stream<List<TimeEntryData>> watchTodayEntries() {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return (select(timeEntries)
          ..where((t) =>
              t.startTime.isBiggerOrEqualValue(startOfDay) &
              t.startTime.isSmallerThanValue(endOfDay))
          ..orderBy([(t) => OrderingTerm.desc(t.startTime)]))
        .watch();
  }
}
