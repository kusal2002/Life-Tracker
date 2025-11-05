import 'package:life_tracker/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

/// Default life categories for time tracking
class LifeCategories {
  static const List<LifeCategory> defaultCategories = [
    LifeCategory(
      id: 'work',
      name: 'Work',
      icon: Icons.work_outline,
      color: AppColors.work,
      description: 'Professional work, meetings, projects',
    ),
    LifeCategory(
      id: 'fitness',
      name: 'Fitness',
      icon: Icons.fitness_center,
      color: AppColors.fitness,
      description: 'Exercise, sports, physical activities',
    ),
    LifeCategory(
      id: 'social',
      name: 'Social',
      icon: Icons.people_outline,
      color: AppColors.social,
      description: 'Family time, friends, relationships',
    ),
    LifeCategory(
      id: 'rest',
      name: 'Rest',
      icon: Icons.bed_outlined,
      color: AppColors.rest,
      description: 'Sleep, relaxation, downtime',
    ),
    LifeCategory(
      id: 'growth',
      name: 'Personal Growth',
      icon: Icons.school_outlined,
      color: AppColors.growth,
      description: 'Learning, reading, self-development',
    ),
    LifeCategory(
      id: 'hobbies',
      name: 'Hobbies',
      icon: Icons.palette_outlined,
      color: AppColors.hobbies,
      description: 'Creative activities, interests, fun',
    ),
  ];

  /// Get category by ID
  static LifeCategory? getCategoryById(String id) {
    try {
      return defaultCategories.firstWhere((cat) => cat.id == id);
    } catch (_) {
      return null;
    }
  }

  /// Get category by name
  static LifeCategory? getCategoryByName(String name) {
    try {
      return defaultCategories.firstWhere(
        (cat) => cat.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (_) {
      return null;
    }
  }
}

/// Life category model
class LifeCategory {
  final String id;
  final String name;
  final IconData icon;
  final Color color;
  final String description;

  const LifeCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.description,
  });
}
