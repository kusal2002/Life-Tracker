import 'package:flutter/material.dart';

/// Design system colors for Life Tracker app
class AppColors {
  // Brand colors
  static const primary = Color(0xFF6C63FF);
  static const secondary = Color(0xFF4CAF50);
  static const accent = Color(0xFFFF6B9D);

  // Life category colors
  static const work = Color(0xFF2196F3); // Blue
  static const fitness = Color(0xFFFF5722); // Orange
  static const social = Color(0xFF9C27B0); // Purple
  static const rest = Color(0xFF00BCD4); // Cyan
  static const growth = Color(0xFF4CAF50); // Green
  static const hobbies = Color(0xFFFFC107); // Amber

  // Mood colors (1-5 scale)
  static const mood1 = Color(0xFFE53935); // Very bad - Red
  static const mood2 = Color(0xFFFF9800); // Bad - Orange
  static const mood3 = Color(0xFFFFC107); // Neutral - Yellow
  static const mood4 = Color(0xFF8BC34A); // Good - Light green
  static const mood5 = Color(0xFF4CAF50); // Excellent - Green

  // UI colors - Light mode
  static const background = Color(0xFFF5F7FA);
  static const surface = Color(0xFFFFFFFF);
  static const error = Color(0xFFF44336);
  static const success = Color(0xFF4CAF50);
  static const warning = Color(0xFFFF9800);
  static const info = Color(0xFF2196F3);

  // Text colors - Light mode
  static const textPrimary = Color(0xFF212121);
  static const textSecondary = Color(0xFF757575);
  static const textHint = Color(0xFFBDBDBD);

  // Dark mode colors
  static const darkBackground = Color(0xFF121212);
  static const darkSurface = Color(0xFF1E1E1E);
  static const darkSurfaceVariant = Color(0xFF2C2C2C);

  // Text colors - Dark mode
  static const darkTextPrimary = Color(0xFFFFFFFF);
  static const darkTextSecondary = Color(0xFFB0B0B0);
  static const darkTextHint = Color(0xFF757575);

  // Border colors
  static const border = Color(0xFFE0E0E0);
  static const darkBorder = Color(0xFF424242);

  // Shadow colors
  static const shadow = Color(0x1A000000);
  static const darkShadow = Color(0x33000000);

  // Helper method to get category color
  static Color getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'work':
        return work;
      case 'fitness':
      case 'health':
        return fitness;
      case 'social':
      case 'family':
        return social;
      case 'rest':
      case 'sleep':
        return rest;
      case 'growth':
      case 'personal growth':
      case 'learning':
        return growth;
      case 'hobbies':
      case 'hobby':
        return hobbies;
      default:
        return primary;
    }
  }

  // Helper method to get mood color
  static Color getMoodColor(int rating) {
    switch (rating) {
      case 1:
        return mood1;
      case 2:
        return mood2;
      case 3:
        return mood3;
      case 4:
        return mood4;
      case 5:
        return mood5;
      default:
        return mood3;
    }
  }
}
