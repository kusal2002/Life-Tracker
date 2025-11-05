import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// Import tables
import 'package:life_tracker/data/local/tables/time_entries.dart';
import 'package:life_tracker/data/local/tables/goals.dart';
import 'package:life_tracker/data/local/tables/mood_entries.dart';
import 'package:life_tracker/data/local/tables/weekly_reports.dart';

// Import DAOs
import 'package:life_tracker/data/local/daos/time_entry_dao.dart';
import 'package:life_tracker/data/local/daos/goal_dao.dart';
import 'package:life_tracker/data/local/daos/mood_dao.dart';
import 'package:life_tracker/data/local/daos/weekly_report_dao.dart';

part 'database.g.dart';

/// Main database class for Life Tracker
@DriftDatabase(
  tables: [
    TimeEntries,
    Goals,
    MoodEntries,
    WeeklyReports,
  ],
  daos: [
    TimeEntryDao,
    GoalDao,
    MoodDao,
    WeeklyReportDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// DAO instances
  late final TimeEntryDao timeEntryDao = TimeEntryDao(this);
  late final GoalDao goalDao = GoalDao(this);
  late final MoodDao moodDao = MoodDao(this);
  late final WeeklyReportDao weeklyReportDao = WeeklyReportDao(this);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle future migrations here
      },
    );
  }
}

/// Opens a connection to the database
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'life_tracker.db'));
    return NativeDatabase(file);
  });
}
