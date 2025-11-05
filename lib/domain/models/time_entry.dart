import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_tracker/domain/enums/sync_status.dart';

part 'time_entry.freezed.dart';
part 'time_entry.g.dart';

@freezed
class TimeEntry with _$TimeEntry {
  const factory TimeEntry({
    required String id,
    required String category,
    String? subcategory,
    required DateTime startTime,
    DateTime? endTime,
    required int durationSeconds,
    String? note,
    @Default(SyncStatus.local) SyncStatus syncStatus,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TimeEntry;

  factory TimeEntry.fromJson(Map<String, dynamic> json) =>
      _$TimeEntryFromJson(json);
}
