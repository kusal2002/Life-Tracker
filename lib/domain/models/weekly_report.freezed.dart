// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeeklyReport _$WeeklyReportFromJson(Map<String, dynamic> json) {
  return _WeeklyReport.fromJson(json);
}

/// @nodoc
mixin _$WeeklyReport {
  String get id => throw _privateConstructorUsedError;
  DateTime get weekStartDate => throw _privateConstructorUsedError;
  Map<String, int> get categoryBreakdown =>
      throw _privateConstructorUsedError; // category -> seconds
  double get lifeBalanceScore => throw _privateConstructorUsedError; // 0-100
  String? get aiReflection =>
      throw _privateConstructorUsedError; // Premium feature
  List<String> get topAchievements => throw _privateConstructorUsedError;
  DateTime get generatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeeklyReportCopyWith<WeeklyReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyReportCopyWith<$Res> {
  factory $WeeklyReportCopyWith(
          WeeklyReport value, $Res Function(WeeklyReport) then) =
      _$WeeklyReportCopyWithImpl<$Res, WeeklyReport>;
  @useResult
  $Res call(
      {String id,
      DateTime weekStartDate,
      Map<String, int> categoryBreakdown,
      double lifeBalanceScore,
      String? aiReflection,
      List<String> topAchievements,
      DateTime generatedAt});
}

/// @nodoc
class _$WeeklyReportCopyWithImpl<$Res, $Val extends WeeklyReport>
    implements $WeeklyReportCopyWith<$Res> {
  _$WeeklyReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weekStartDate = null,
    Object? categoryBreakdown = null,
    Object? lifeBalanceScore = null,
    Object? aiReflection = freezed,
    Object? topAchievements = null,
    Object? generatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      weekStartDate: null == weekStartDate
          ? _value.weekStartDate
          : weekStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      categoryBreakdown: null == categoryBreakdown
          ? _value.categoryBreakdown
          : categoryBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      lifeBalanceScore: null == lifeBalanceScore
          ? _value.lifeBalanceScore
          : lifeBalanceScore // ignore: cast_nullable_to_non_nullable
              as double,
      aiReflection: freezed == aiReflection
          ? _value.aiReflection
          : aiReflection // ignore: cast_nullable_to_non_nullable
              as String?,
      topAchievements: null == topAchievements
          ? _value.topAchievements
          : topAchievements // ignore: cast_nullable_to_non_nullable
              as List<String>,
      generatedAt: null == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklyReportImplCopyWith<$Res>
    implements $WeeklyReportCopyWith<$Res> {
  factory _$$WeeklyReportImplCopyWith(
          _$WeeklyReportImpl value, $Res Function(_$WeeklyReportImpl) then) =
      __$$WeeklyReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime weekStartDate,
      Map<String, int> categoryBreakdown,
      double lifeBalanceScore,
      String? aiReflection,
      List<String> topAchievements,
      DateTime generatedAt});
}

/// @nodoc
class __$$WeeklyReportImplCopyWithImpl<$Res>
    extends _$WeeklyReportCopyWithImpl<$Res, _$WeeklyReportImpl>
    implements _$$WeeklyReportImplCopyWith<$Res> {
  __$$WeeklyReportImplCopyWithImpl(
      _$WeeklyReportImpl _value, $Res Function(_$WeeklyReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? weekStartDate = null,
    Object? categoryBreakdown = null,
    Object? lifeBalanceScore = null,
    Object? aiReflection = freezed,
    Object? topAchievements = null,
    Object? generatedAt = null,
  }) {
    return _then(_$WeeklyReportImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      weekStartDate: null == weekStartDate
          ? _value.weekStartDate
          : weekStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      categoryBreakdown: null == categoryBreakdown
          ? _value._categoryBreakdown
          : categoryBreakdown // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      lifeBalanceScore: null == lifeBalanceScore
          ? _value.lifeBalanceScore
          : lifeBalanceScore // ignore: cast_nullable_to_non_nullable
              as double,
      aiReflection: freezed == aiReflection
          ? _value.aiReflection
          : aiReflection // ignore: cast_nullable_to_non_nullable
              as String?,
      topAchievements: null == topAchievements
          ? _value._topAchievements
          : topAchievements // ignore: cast_nullable_to_non_nullable
              as List<String>,
      generatedAt: null == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyReportImpl implements _WeeklyReport {
  const _$WeeklyReportImpl(
      {required this.id,
      required this.weekStartDate,
      required final Map<String, int> categoryBreakdown,
      required this.lifeBalanceScore,
      this.aiReflection,
      final List<String> topAchievements = const [],
      required this.generatedAt})
      : _categoryBreakdown = categoryBreakdown,
        _topAchievements = topAchievements;

  factory _$WeeklyReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyReportImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime weekStartDate;
  final Map<String, int> _categoryBreakdown;
  @override
  Map<String, int> get categoryBreakdown {
    if (_categoryBreakdown is EqualUnmodifiableMapView)
      return _categoryBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryBreakdown);
  }

// category -> seconds
  @override
  final double lifeBalanceScore;
// 0-100
  @override
  final String? aiReflection;
// Premium feature
  final List<String> _topAchievements;
// Premium feature
  @override
  @JsonKey()
  List<String> get topAchievements {
    if (_topAchievements is EqualUnmodifiableListView) return _topAchievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topAchievements);
  }

  @override
  final DateTime generatedAt;

  @override
  String toString() {
    return 'WeeklyReport(id: $id, weekStartDate: $weekStartDate, categoryBreakdown: $categoryBreakdown, lifeBalanceScore: $lifeBalanceScore, aiReflection: $aiReflection, topAchievements: $topAchievements, generatedAt: $generatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.weekStartDate, weekStartDate) ||
                other.weekStartDate == weekStartDate) &&
            const DeepCollectionEquality()
                .equals(other._categoryBreakdown, _categoryBreakdown) &&
            (identical(other.lifeBalanceScore, lifeBalanceScore) ||
                other.lifeBalanceScore == lifeBalanceScore) &&
            (identical(other.aiReflection, aiReflection) ||
                other.aiReflection == aiReflection) &&
            const DeepCollectionEquality()
                .equals(other._topAchievements, _topAchievements) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      weekStartDate,
      const DeepCollectionEquality().hash(_categoryBreakdown),
      lifeBalanceScore,
      aiReflection,
      const DeepCollectionEquality().hash(_topAchievements),
      generatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyReportImplCopyWith<_$WeeklyReportImpl> get copyWith =>
      __$$WeeklyReportImplCopyWithImpl<_$WeeklyReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyReportImplToJson(
      this,
    );
  }
}

abstract class _WeeklyReport implements WeeklyReport {
  const factory _WeeklyReport(
      {required final String id,
      required final DateTime weekStartDate,
      required final Map<String, int> categoryBreakdown,
      required final double lifeBalanceScore,
      final String? aiReflection,
      final List<String> topAchievements,
      required final DateTime generatedAt}) = _$WeeklyReportImpl;

  factory _WeeklyReport.fromJson(Map<String, dynamic> json) =
      _$WeeklyReportImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get weekStartDate;
  @override
  Map<String, int> get categoryBreakdown;
  @override // category -> seconds
  double get lifeBalanceScore;
  @override // 0-100
  String? get aiReflection;
  @override // Premium feature
  List<String> get topAchievements;
  @override
  DateTime get generatedAt;
  @override
  @JsonKey(ignore: true)
  _$$WeeklyReportImplCopyWith<_$WeeklyReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
