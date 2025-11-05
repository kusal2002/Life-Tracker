import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import 'package:uuid/uuid.dart';
import 'package:life_tracker/presentation/providers/database_providers.dart';
import 'package:life_tracker/data/local/database.dart'; // Import for Companion classes

class DatabaseTestScreen extends ConsumerStatefulWidget {
  const DatabaseTestScreen({super.key});

  @override
  ConsumerState<DatabaseTestScreen> createState() => _DatabaseTestScreenState();
}

class _DatabaseTestScreenState extends ConsumerState<DatabaseTestScreen> {
  final _uuid = const Uuid();
  String _message = 'Ready to test database...';

  Future<void> _testDatabase() async {
    try {
      final timeEntryDao = ref.read(timeEntryDaoProvider);
      final goalDao = ref.read(goalDaoProvider);
      final moodDao = ref.read(moodDaoProvider);

      // Test 1: Insert a time entry
      final timeEntryId = _uuid.v4();
      await timeEntryDao.insertTimeEntry(
        TimeEntriesCompanion.insert(
          id: timeEntryId,
          category: 'Work',
          subcategory: const drift.Value('Development'),
          startTime: DateTime.now().subtract(const Duration(hours: 2)),
          endTime: drift.Value(DateTime.now()),
          durationSeconds: 7200, // 2 hours
          note: const drift.Value('Testing database integration'),
        ),
      );

      // Test 2: Insert a goal
      final goalId = _uuid.v4();
      await goalDao.insertGoal(
        GoalsCompanion.insert(
          id: goalId,
          title: 'Complete database setup',
          category: 'Work',
          targetValue: 100.0,
          currentValue: const drift.Value(75.0),
          unit: 'percent',
          deadline: drift.Value(DateTime.now().add(const Duration(days: 7))),
        ),
      );

      // Test 3: Insert a mood entry
      final moodId = _uuid.v4();
      await moodDao.insertMoodEntry(
        MoodEntriesCompanion.insert(
          id: moodId,
          date: DateTime.now(),
          rating: 5,
          note: const drift.Value('Database working perfectly! 🎉'),
          tags: const drift.Value('["happy", "productive"]'),
        ),
      );

      // Test 4: Query data
      final timeEntries = await timeEntryDao.getAllTimeEntries();
      final goals = await goalDao.getAllGoals();
      final moodEntries = await moodDao.getAllMoodEntries();

      setState(() {
        _message = '''
✅ Database Test SUCCESS!

📊 Data Inserted:
• Time Entries: ${timeEntries.length}
• Goals: ${goals.length}
• Mood Entries: ${moodEntries.length}

Last Time Entry:
${timeEntries.isNotEmpty ? timeEntries.first.category : 'None'}

Last Goal:
${goals.isNotEmpty ? goals.first.title : 'None'}

Last Mood:
${moodEntries.isNotEmpty ? '${moodEntries.first.rating}/5' : 'None'}

🎉 All database operations working!
        ''';
      });
    } catch (e) {
      setState(() {
        _message = '❌ Error: $e';
      });
    }
  }

  Future<void> _clearDatabase() async {
    try {
      final database = ref.read(databaseProvider);
      
      // Delete all data
      await database.delete(database.timeEntries).go();
      await database.delete(database.goals).go();
      await database.delete(database.moodEntries).go();
      await database.delete(database.weeklyReports).go();

      setState(() {
        _message = '🗑️ Database cleared successfully!';
      });
    } catch (e) {
      setState(() {
        _message = '❌ Error clearing database: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.storage,
              size: 64,
              color: Colors.blue,
            ),
            const SizedBox(height: 24),
            const Text(
              'Drift Database Test',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _message,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _testDatabase,
              icon: const Icon(Icons.play_arrow),
              label: const Text('Run Database Test'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: _clearDatabase,
              icon: const Icon(Icons.delete_outline),
              label: const Text('Clear Database'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
