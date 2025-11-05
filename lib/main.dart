import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:life_tracker/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Initialize Firebase
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // TODO: Initialize local database
  // await DatabaseService.initialize();

  // TODO: Initialize notifications
  // await NotificationService.initialize();

  runApp(
    const ProviderScope(
      child: LifeTrackerApp(),
    ),
  );
}
