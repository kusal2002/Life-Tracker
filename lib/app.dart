import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_tracker/core/theme/app_theme.dart';
import 'package:life_tracker/presentation/screens/database_test_screen.dart';

class LifeTrackerApp extends ConsumerWidget {
  const LifeTrackerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final router = ref.watch(routerProvider);
    // final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'Life Tracker',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // TODO: Use themeModeProvider
      // router: router,
      home: const DatabaseTestScreen(),
    );
  }
}
