// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weekly_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeeklyReportImpl _$$WeeklyReportImplFromJson(Map<String, dynamic> json) =>
    _$WeeklyReportImpl(
      id: json['id'] as String,
      weekStartDate: DateTime.parse(json['weekStartDate'] as String),
      categoryBreakdown:
          Map<String, int>.from(json['categoryBreakdown'] as Map),
      lifeBalanceScore: (json['lifeBalanceScore'] as num).toDouble(),
      aiReflection: json['aiReflection'] as String?,
      topAchievements: (json['topAchievements'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      generatedAt: DateTime.parse(json['generatedAt'] as String),
    );

Map<String, dynamic> _$$WeeklyReportImplToJson(_$WeeklyReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weekStartDate': instance.weekStartDate.toIso8601String(),
      'categoryBreakdown': instance.categoryBreakdown,
      'lifeBalanceScore': instance.lifeBalanceScore,
      'aiReflection': instance.aiReflection,
      'topAchievements': instance.topAchievements,
      'generatedAt': instance.generatedAt.toIso8601String(),
    };
