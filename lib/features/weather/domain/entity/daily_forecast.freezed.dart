// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_forecast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyForecast {

 DateTime get date;// 예보 날짜
 double? get minTemperatureCelsius;// TMN: 일 최저 기온 (℃)
 double? get maxTemperatureCelsius;// TMX: 일 최고 기온 (℃)
// 일별 POP, SKY 등은 시간별 데이터를 집계하여 생성하거나, 별도 API 항목이 있다면 사용
 int? get precipitationProbabilityAvgPercent;// 일 평균 강수 확률 (계산 필요)
 String? get overallSkyConditionCode;
/// Create a copy of DailyForecast
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyForecastCopyWith<DailyForecast> get copyWith => _$DailyForecastCopyWithImpl<DailyForecast>(this as DailyForecast, _$identity);

  /// Serializes this DailyForecast to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyForecast&&(identical(other.date, date) || other.date == date)&&(identical(other.minTemperatureCelsius, minTemperatureCelsius) || other.minTemperatureCelsius == minTemperatureCelsius)&&(identical(other.maxTemperatureCelsius, maxTemperatureCelsius) || other.maxTemperatureCelsius == maxTemperatureCelsius)&&(identical(other.precipitationProbabilityAvgPercent, precipitationProbabilityAvgPercent) || other.precipitationProbabilityAvgPercent == precipitationProbabilityAvgPercent)&&(identical(other.overallSkyConditionCode, overallSkyConditionCode) || other.overallSkyConditionCode == overallSkyConditionCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,minTemperatureCelsius,maxTemperatureCelsius,precipitationProbabilityAvgPercent,overallSkyConditionCode);

@override
String toString() {
  return 'DailyForecast(date: $date, minTemperatureCelsius: $minTemperatureCelsius, maxTemperatureCelsius: $maxTemperatureCelsius, precipitationProbabilityAvgPercent: $precipitationProbabilityAvgPercent, overallSkyConditionCode: $overallSkyConditionCode)';
}


}

/// @nodoc
abstract mixin class $DailyForecastCopyWith<$Res>  {
  factory $DailyForecastCopyWith(DailyForecast value, $Res Function(DailyForecast) _then) = _$DailyForecastCopyWithImpl;
@useResult
$Res call({
 DateTime date, double? minTemperatureCelsius, double? maxTemperatureCelsius, int? precipitationProbabilityAvgPercent, String? overallSkyConditionCode
});




}
/// @nodoc
class _$DailyForecastCopyWithImpl<$Res>
    implements $DailyForecastCopyWith<$Res> {
  _$DailyForecastCopyWithImpl(this._self, this._then);

  final DailyForecast _self;
  final $Res Function(DailyForecast) _then;

/// Create a copy of DailyForecast
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? minTemperatureCelsius = freezed,Object? maxTemperatureCelsius = freezed,Object? precipitationProbabilityAvgPercent = freezed,Object? overallSkyConditionCode = freezed,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,minTemperatureCelsius: freezed == minTemperatureCelsius ? _self.minTemperatureCelsius : minTemperatureCelsius // ignore: cast_nullable_to_non_nullable
as double?,maxTemperatureCelsius: freezed == maxTemperatureCelsius ? _self.maxTemperatureCelsius : maxTemperatureCelsius // ignore: cast_nullable_to_non_nullable
as double?,precipitationProbabilityAvgPercent: freezed == precipitationProbabilityAvgPercent ? _self.precipitationProbabilityAvgPercent : precipitationProbabilityAvgPercent // ignore: cast_nullable_to_non_nullable
as int?,overallSkyConditionCode: freezed == overallSkyConditionCode ? _self.overallSkyConditionCode : overallSkyConditionCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _DailyForecast implements DailyForecast {
  const _DailyForecast({required this.date, this.minTemperatureCelsius, this.maxTemperatureCelsius, this.precipitationProbabilityAvgPercent, this.overallSkyConditionCode});
  factory _DailyForecast.fromJson(Map<String, dynamic> json) => _$DailyForecastFromJson(json);

@override final  DateTime date;
// 예보 날짜
@override final  double? minTemperatureCelsius;
// TMN: 일 최저 기온 (℃)
@override final  double? maxTemperatureCelsius;
// TMX: 일 최고 기온 (℃)
// 일별 POP, SKY 등은 시간별 데이터를 집계하여 생성하거나, 별도 API 항목이 있다면 사용
@override final  int? precipitationProbabilityAvgPercent;
// 일 평균 강수 확률 (계산 필요)
@override final  String? overallSkyConditionCode;

/// Create a copy of DailyForecast
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyForecastCopyWith<_DailyForecast> get copyWith => __$DailyForecastCopyWithImpl<_DailyForecast>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyForecastToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyForecast&&(identical(other.date, date) || other.date == date)&&(identical(other.minTemperatureCelsius, minTemperatureCelsius) || other.minTemperatureCelsius == minTemperatureCelsius)&&(identical(other.maxTemperatureCelsius, maxTemperatureCelsius) || other.maxTemperatureCelsius == maxTemperatureCelsius)&&(identical(other.precipitationProbabilityAvgPercent, precipitationProbabilityAvgPercent) || other.precipitationProbabilityAvgPercent == precipitationProbabilityAvgPercent)&&(identical(other.overallSkyConditionCode, overallSkyConditionCode) || other.overallSkyConditionCode == overallSkyConditionCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,minTemperatureCelsius,maxTemperatureCelsius,precipitationProbabilityAvgPercent,overallSkyConditionCode);

@override
String toString() {
  return 'DailyForecast(date: $date, minTemperatureCelsius: $minTemperatureCelsius, maxTemperatureCelsius: $maxTemperatureCelsius, precipitationProbabilityAvgPercent: $precipitationProbabilityAvgPercent, overallSkyConditionCode: $overallSkyConditionCode)';
}


}

/// @nodoc
abstract mixin class _$DailyForecastCopyWith<$Res> implements $DailyForecastCopyWith<$Res> {
  factory _$DailyForecastCopyWith(_DailyForecast value, $Res Function(_DailyForecast) _then) = __$DailyForecastCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, double? minTemperatureCelsius, double? maxTemperatureCelsius, int? precipitationProbabilityAvgPercent, String? overallSkyConditionCode
});




}
/// @nodoc
class __$DailyForecastCopyWithImpl<$Res>
    implements _$DailyForecastCopyWith<$Res> {
  __$DailyForecastCopyWithImpl(this._self, this._then);

  final _DailyForecast _self;
  final $Res Function(_DailyForecast) _then;

/// Create a copy of DailyForecast
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? minTemperatureCelsius = freezed,Object? maxTemperatureCelsius = freezed,Object? precipitationProbabilityAvgPercent = freezed,Object? overallSkyConditionCode = freezed,}) {
  return _then(_DailyForecast(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,minTemperatureCelsius: freezed == minTemperatureCelsius ? _self.minTemperatureCelsius : minTemperatureCelsius // ignore: cast_nullable_to_non_nullable
as double?,maxTemperatureCelsius: freezed == maxTemperatureCelsius ? _self.maxTemperatureCelsius : maxTemperatureCelsius // ignore: cast_nullable_to_non_nullable
as double?,precipitationProbabilityAvgPercent: freezed == precipitationProbabilityAvgPercent ? _self.precipitationProbabilityAvgPercent : precipitationProbabilityAvgPercent // ignore: cast_nullable_to_non_nullable
as int?,overallSkyConditionCode: freezed == overallSkyConditionCode ? _self.overallSkyConditionCode : overallSkyConditionCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
