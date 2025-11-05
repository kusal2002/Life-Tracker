import 'package:drift/drift.dart';

/// Weekly reports table - stores generated analytics
@DataClassName('WeeklyReportData')
class WeeklyReports extends Table {
  TextColumn get id => text()();
  DateTimeColumn get weekStartDate => dateTime()();
  TextColumn get categoryBreakdown => text()(); // JSON: {"Work": 14400, "Fitness": 3600}
  RealColumn get lifeBalanceScore => real()();
  TextColumn get aiReflection => text().nullable()(); // Premium feature
  TextColumn get topAchievements => text().nullable()(); // JSON array as string
  DateTimeColumn get generatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
