import 'package:drift/drift.dart';

/// Time entries table - stores all time tracking data
@DataClassName('TimeEntryData')
class TimeEntries extends Table {
  TextColumn get id => text()();
  TextColumn get category => text()();
  TextColumn get subcategory => text().nullable()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime().nullable()();
  IntColumn get durationSeconds => integer()();
  TextColumn get note => text().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('local'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
