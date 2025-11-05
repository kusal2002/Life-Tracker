import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:life_tracker/domain/enums/sync_status.dart';

part 'mood_entry.freezed.dart';
part 'mood_entry.g.dart';

@freezed
class MoodEntry with _$MoodEntry {
  const factory MoodEntry({
    required String id,
    required DateTime date,
    required int rating, // 1-5
    String? note,
    @Default([]) List<String> tags,
    @Default(SyncStatus.local) SyncStatus syncStatus,
  }) = _MoodEntry;

  factory MoodEntry.fromJson(Map<String, dynamic> json) =>
      _$MoodEntryFromJson(json);
}
