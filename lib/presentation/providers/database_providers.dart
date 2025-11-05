import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_tracker/data/local/database.dart';
import 'package:life_tracker/data/local/daos/time_entry_dao.dart';
import 'package:life_tracker/data/local/daos/goal_dao.dart';
import 'package:life_tracker/data/local/daos/mood_dao.dart';
import 'package:life_tracker/data/local/daos/weekly_report_dao.dart';

/// Provider for the main database instance
final databaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  
  // Close database when provider is disposed
  ref.onDispose(() => database.close());
  
  return database;
});

/// Provider for TimeEntryDao
final timeEntryDaoProvider = Provider<TimeEntryDao>((ref) {
  final database = ref.watch(databaseProvider);
  return database.timeEntryDao;
});

/// Provider for GoalDao
final goalDaoProvider = Provider<GoalDao>((ref) {
  final database = ref.watch(databaseProvider);
  return database.goalDao;
});

/// Provider for MoodDao
final moodDaoProvider = Provider<MoodDao>((ref) {
  final database = ref.watch(databaseProvider);
  return database.moodDao;
});

/// Provider for WeeklyReportDao
final weeklyReportDaoProvider = Provider<WeeklyReportDao>((ref) {
  final database = ref.watch(databaseProvider);
  return database.weeklyReportDao;
});
