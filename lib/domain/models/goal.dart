import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_tracker/domain/enums/sync_status.dart';

part 'goal.freezed.dart';
part 'goal.g.dart';

@freezed
class Goal with _$Goal {
  const factory Goal({
    required String id,
    required String title,
    required String category,
    required double targetValue,
    @Default(0.0) double currentValue,
    required String unit, // 'hours', 'count', 'sessions', 'km', etc.
    DateTime? deadline,
    @Default(false) bool isCompleted,
    required DateTime createdAt,
    @Default(SyncStatus.local) SyncStatus syncStatus,
  }) = _Goal;

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);
}

extension GoalExtension on Goal {
  /// Calculate progress percentage (0-100)
  double get progressPercentage {
    if (targetValue == 0) return 0;
    return ((currentValue / targetValue) * 100).clamp(0, 100);
  }

  /// Check if goal is overdue
  bool get isOverdue {
    if (deadline == null || isCompleted) return false;
    return DateTime.now().isAfter(deadline!);
  }

  /// Days remaining until deadline
  int? get daysRemaining {
    if (deadline == null) return null;
    final now = DateTime.now();
    if (now.isAfter(deadline!)) return 0;
    return deadline!.difference(now).inDays;
  }
}
