import 'package:freezed_annotation/freezed_annotation.dart';

part 'weekly_report.freezed.dart';
part 'weekly_report.g.dart';

@freezed
class WeeklyReport with _$WeeklyReport {
  const factory WeeklyReport({
    required String id,
    required DateTime weekStartDate,
    required Map<String, int> categoryBreakdown, // category -> seconds
    required double lifeBalanceScore, // 0-100
    String? aiReflection, // Premium feature
    @Default([]) List<String> topAchievements,
    required DateTime generatedAt,
  }) = _WeeklyReport;

  factory WeeklyReport.fromJson(Map<String, dynamic> json) =>
      _$WeeklyReportFromJson(json);
}

extension WeeklyReportExtension on WeeklyReport {
  /// Get total hours logged this week
  double get totalHours {
    final totalSeconds = categoryBreakdown.values.fold(0, (a, b) => a + b);
    return totalSeconds / 3600;
  }

  /// Get category with most time
  String? get topCategory {
    if (categoryBreakdown.isEmpty) return null;
    return categoryBreakdown.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key;
  }

  /// Get balance grade (A+, A, B, C, D, F)
  String get balanceGrade {
    if (lifeBalanceScore >= 90) return 'A+';
    if (lifeBalanceScore >= 80) return 'A';
    if (lifeBalanceScore >= 70) return 'B';
    if (lifeBalanceScore >= 60) return 'C';
    if (lifeBalanceScore >= 50) return 'D';
    return 'F';
  }
}
