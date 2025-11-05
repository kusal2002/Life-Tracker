import 'package:drift/drift.dart';
import 'package:life_tracker/data/local/database.dart';
import 'package:life_tracker/data/local/tables/weekly_reports.dart';

part 'weekly_report_dao.g.dart';

/// DAO for weekly reports operations
@DriftAccessor(tables: [WeeklyReports])
class WeeklyReportDao extends DatabaseAccessor<AppDatabase>
    with _$WeeklyReportDaoMixin {
  WeeklyReportDao(AppDatabase db) : super(db);

  /// Get all weekly reports
  Future<List<WeeklyReportData>> getAllReports() {
    return (select(weeklyReports)
          ..orderBy([(r) => OrderingTerm.desc(r.weekStartDate)]))
        .get();
  }

  /// Get report for a specific week
  Future<WeeklyReportData?> getReportForWeek(DateTime weekStart) {
    return (select(weeklyReports)
          ..where((r) => r.weekStartDate.equals(weekStart)))
        .getSingleOrNull();
  }

  /// Get a single report by ID
  Future<WeeklyReportData?> getReportById(String id) {
    return (select(weeklyReports)..where((r) => r.id.equals(id)))
        .getSingleOrNull();
  }

  /// Get recent reports (last N weeks)
  Future<List<WeeklyReportData>> getRecentReports(int count) {
    return (select(weeklyReports)
          ..orderBy([(r) => OrderingTerm.desc(r.weekStartDate)])
          ..limit(count))
        .get();
  }

  /// Get reports for a date range
  Future<List<WeeklyReportData>> getReportsInRange(
    DateTime startDate,
    DateTime endDate,
  ) {
    return (select(weeklyReports)
          ..where((r) =>
              r.weekStartDate.isBiggerOrEqualValue(startDate) &
              r.weekStartDate.isSmallerOrEqualValue(endDate))
          ..orderBy([(r) => OrderingTerm.desc(r.weekStartDate)]))
        .get();
  }

  /// Insert a new weekly report
  Future<int> insertReport(WeeklyReportsCompanion report) {
    return into(weeklyReports).insert(report);
  }

  /// Update an existing report
  Future<bool> updateReport(WeeklyReportData report) {
    return update(weeklyReports).replace(report);
  }

  /// Update AI reflection for a report
  Future<int> updateAiReflection(String id, String reflection) {
    return (update(weeklyReports)..where((r) => r.id.equals(id)))
        .write(WeeklyReportsCompanion(aiReflection: Value(reflection)));
  }

  /// Delete a report
  Future<int> deleteReport(String id) {
    return (delete(weeklyReports)..where((r) => r.id.equals(id))).go();
  }

  /// Check if report exists for a week
  Future<bool> reportExistsForWeek(DateTime weekStart) async {
    final report = await getReportForWeek(weekStart);
    return report != null;
  }

  /// Get reports with high balance scores (>= 80)
  Future<List<WeeklyReportData>> getHighBalanceReports() {
    return (select(weeklyReports)
          ..where((r) => r.lifeBalanceScore.isBiggerOrEqualValue(80.0))
          ..orderBy([(r) => OrderingTerm.desc(r.lifeBalanceScore)]))
        .get();
  }

  /// Get reports with low balance scores (< 60)
  Future<List<WeeklyReportData>> getLowBalanceReports() {
    return (select(weeklyReports)
          ..where((r) => r.lifeBalanceScore.isSmallerThanValue(60.0))
          ..orderBy([(r) => OrderingTerm.asc(r.lifeBalanceScore)]))
        .get();
  }

  /// Get average balance score for all reports
  Future<double> getAverageBalanceScore() async {
    final reports = await getAllReports();
    if (reports.isEmpty) return 0.0;

    final sum = reports.fold(
        0.0, (sum, report) => sum + report.lifeBalanceScore);
    return sum / reports.length;
  }

  /// Watch all reports (for real-time updates)
  Stream<List<WeeklyReportData>> watchAllReports() {
    return (select(weeklyReports)
          ..orderBy([(r) => OrderingTerm.desc(r.weekStartDate)]))
        .watch();
  }

  /// Watch recent reports
  Stream<List<WeeklyReportData>> watchRecentReports(int count) {
    return (select(weeklyReports)
          ..orderBy([(r) => OrderingTerm.desc(r.weekStartDate)])
          ..limit(count))
        .watch();
  }

  /// Watch a specific report
  Stream<WeeklyReportData?> watchReport(String id) {
    return (select(weeklyReports)..where((r) => r.id.equals(id)))
        .watchSingleOrNull();
  }
}
