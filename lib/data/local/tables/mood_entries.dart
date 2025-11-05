import 'package:drift/drift.dart';

/// Mood entries table - stores daily mood logs
@DataClassName('MoodEntryData')
class MoodEntries extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  IntColumn get rating => integer()(); // 1-5 scale
  TextColumn get note => text().nullable()();
  TextColumn get tags => text().nullable()(); // JSON array as string
  TextColumn get syncStatus => text().withDefault(const Constant('local'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}
