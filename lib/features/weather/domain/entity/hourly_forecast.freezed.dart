// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hourly_forecast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HourlyForecast {

 DateTime get forecastDateTime;// 예보 시각 (fcstDate + fcstTime)
 double? get temperatureCelsius;// TMP: 기온 (℃)
 String? get skyConditionCode;// SKY: 하늘 상태 코드
 String? get precipitationTypeCode;// PTY: 강수 형태 코드
 int? get precipitationProbabilityPercent;// POP: 강수 확률 (%)
// PCP, SNO는 "강수없음", "1.0mm" 등 문자열과 숫자 혼용 가능성이 있으므로 String으로 우선 처리
// 또는 매퍼에서 파싱하여 double?로 변경 (예: "강수없음" -> 0.0 or null)
 String? get precipitationValue;// PCP: 1시간 강수량 (문자열 값)
 String? get snowValue;// SNO: 1시간 신적설 (문자열 값)
 double? get humidityPercent;// REH: 습도 (%)
 double? get windSpeedMps;// WSD: 풍속 (m/s)
 int? get windDirectionDeg;// VEC: 풍향 (deg)
 double? get windEastWestMps;// UUU: 동서바람성분 (m/s)
 double? get windNorthSouthMps;// VVV: 남북바람성분 (m/s)
 double? get waveHeightM;
/// Create a copy of HourlyForecast
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HourlyForecastCopyWith<HourlyForecast> get copyWith => _$HourlyForecastCopyWithImpl<HourlyForecast>(this as HourlyForecast, _$identity);

  /// Serializes this HourlyForecast to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HourlyForecast&&(identical(other.forecastDateTime, forecastDateTime) || other.forecastDateTime == forecastDateTime)&&(identical(other.temperatureCelsius, temperatureCelsius) || other.temperatureCelsius == temperatureCelsius)&&(identical(other.skyConditionCode, skyConditionCode) || other.skyConditionCode == skyConditionCode)&&(identical(other.precipitationTypeCode, precipitationTypeCode) || other.precipitationTypeCode == precipitationTypeCode)&&(identical(other.precipitationProbabilityPercent, precipitationProbabilityPercent) || other.precipitationProbabilityPercent == precipitationProbabilityPercent)&&(identical(other.precipitationValue, precipitationValue) || other.precipitationValue == precipitationValue)&&(identical(other.snowValue, snowValue) || other.snowValue == snowValue)&&(identical(other.humidityPercent, humidityPercent) || other.humidityPercent == humidityPercent)&&(identical(other.windSpeedMps, windSpeedMps) || other.windSpeedMps == windSpeedMps)&&(identical(other.windDirectionDeg, windDirectionDeg) || other.windDirectionDeg == windDirectionDeg)&&(identical(other.windEastWestMps, windEastWestMps) || other.windEastWestMps == windEastWestMps)&&(identical(other.windNorthSouthMps, windNorthSouthMps) || other.windNorthSouthMps == windNorthSouthMps)&&(identical(other.waveHeightM, waveHeightM) || other.waveHeightM == waveHeightM));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,forecastDateTime,temperatureCelsius,skyConditionCode,precipitationTypeCode,precipitationProbabilityPercent,precipitationValue,snowValue,humidityPercent,windSpeedMps,windDirectionDeg,windEastWestMps,windNorthSouthMps,waveHeightM);

@override
String toString() {
  return 'HourlyForecast(forecastDateTime: $forecastDateTime, temperatureCelsius: $temperatureCelsius, skyConditionCode: $skyConditionCode, precipitationTypeCode: $precipitationTypeCode, precipitationProbabilityPercent: $precipitationProbabilityPercent, precipitationValue: $precipitationValue, snowValue: $snowValue, humidityPercent: $humidityPercent, windSpeedMps: $windSpeedMps, windDirectionDeg: $windDirectionDeg, windEastWestMps: $windEastWestMps, windNorthSouthMps: $windNorthSouthMps, waveHeightM: $waveHeightM)';
}


}

/// @nodoc
abstract mixin class $HourlyForecastCopyWith<$Res>  {
  factory $HourlyForecastCopyWith(HourlyForecast value, $Res Function(HourlyForecast) _then) = _$HourlyForecastCopyWithImpl;
@useResult
$Res call({
 DateTime forecastDateTime, double? temperatureCelsius, String? skyConditionCode, String? precipitationTypeCode, int? precipitationProbabilityPercent, String? precipitationValue, String? snowValue, double? humidityPercent, double? windSpeedMps, int? windDirectionDeg, double? windEastWestMps, double? windNorthSouthMps, double? waveHeightM
});




}
/// @nodoc
class _$HourlyForecastCopyWithImpl<$Res>
    implements $HourlyForecastCopyWith<$Res> {
  _$HourlyForecastCopyWithImpl(this._self, this._then);

  final HourlyForecast _self;
  final $Res Function(HourlyForecast) _then;

/// Create a copy of HourlyForecast
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? forecastDateTime = null,Object? temperatureCelsius = freezed,Object? skyConditionCode = freezed,Object? precipitationTypeCode = freezed,Object? precipitationProbabilityPercent = freezed,Object? precipitationValue = freezed,Object? snowValue = freezed,Object? humidityPercent = freezed,Object? windSpeedMps = freezed,Object? windDirectionDeg = freezed,Object? windEastWestMps = freezed,Object? windNorthSouthMps = freezed,Object? waveHeightM = freezed,}) {
  return _then(_self.copyWith(
forecastDateTime: null == forecastDateTime ? _self.forecastDateTime : forecastDateTime // ignore: cast_nullable_to_non_nullable
as DateTime,temperatureCelsius: freezed == temperatureCelsius ? _self.temperatureCelsius : temperatureCelsius // ignore: cast_nullable_to_non_nullable
as double?,skyConditionCode: freezed == skyConditionCode ? _self.skyConditionCode : skyConditionCode // ignore: cast_nullable_to_non_nullable
as String?,precipitationTypeCode: freezed == precipitationTypeCode ? _self.precipitationTypeCode : precipitationTypeCode // ignore: cast_nullable_to_non_nullable
as String?,precipitationProbabilityPercent: freezed == precipitationProbabilityPercent ? _self.precipitationProbabilityPercent : precipitationProbabilityPercent // ignore: cast_nullable_to_non_nullable
as int?,precipitationValue: freezed == precipitationValue ? _self.precipitationValue : precipitationValue // ignore: cast_nullable_to_non_nullable
as String?,snowValue: freezed == snowValue ? _self.snowValue : snowValue // ignore: cast_nullable_to_non_nullable
as String?,humidityPercent: freezed == humidityPercent ? _self.humidityPercent : humidityPercent // ignore: cast_nullable_to_non_nullable
as double?,windSpeedMps: freezed == windSpeedMps ? _self.windSpeedMps : windSpeedMps // ignore: cast_nullable_to_non_nullable
as double?,windDirectionDeg: freezed == windDirectionDeg ? _self.windDirectionDeg : windDirectionDeg // ignore: cast_nullable_to_non_nullable
as int?,windEastWestMps: freezed == windEastWestMps ? _self.windEastWestMps : windEastWestMps // ignore: cast_nullable_to_non_nullable
as double?,windNorthSouthMps: freezed == windNorthSouthMps ? _self.windNorthSouthMps : windNorthSouthMps // ignore: cast_nullable_to_non_nullable
as double?,waveHeightM: freezed == waveHeightM ? _self.waveHeightM : waveHeightM // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _HourlyForecast implements HourlyForecast {
  const _HourlyForecast({required this.forecastDateTime, this.temperatureCelsius, this.skyConditionCode, this.precipitationTypeCode, this.precipitationProbabilityPercent, this.precipitationValue, this.snowValue, this.humidityPercent, this.windSpeedMps, this.windDirectionDeg, this.windEastWestMps, this.windNorthSouthMps, this.waveHeightM});
  factory _HourlyForecast.fromJson(Map<String, dynamic> json) => _$HourlyForecastFromJson(json);

@override final  DateTime forecastDateTime;
// 예보 시각 (fcstDate + fcstTime)
@override final  double? temperatureCelsius;
// TMP: 기온 (℃)
@override final  String? skyConditionCode;
// SKY: 하늘 상태 코드
@override final  String? precipitationTypeCode;
// PTY: 강수 형태 코드
@override final  int? precipitationProbabilityPercent;
// POP: 강수 확률 (%)
// PCP, SNO는 "강수없음", "1.0mm" 등 문자열과 숫자 혼용 가능성이 있으므로 String으로 우선 처리
// 또는 매퍼에서 파싱하여 double?로 변경 (예: "강수없음" -> 0.0 or null)
@override final  String? precipitationValue;
// PCP: 1시간 강수량 (문자열 값)
@override final  String? snowValue;
// SNO: 1시간 신적설 (문자열 값)
@override final  double? humidityPercent;
// REH: 습도 (%)
@override final  double? windSpeedMps;
// WSD: 풍속 (m/s)
@override final  int? windDirectionDeg;
// VEC: 풍향 (deg)
@override final  double? windEastWestMps;
// UUU: 동서바람성분 (m/s)
@override final  double? windNorthSouthMps;
// VVV: 남북바람성분 (m/s)
@override final  double? waveHeightM;

/// Create a copy of HourlyForecast
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HourlyForecastCopyWith<_HourlyForecast> get copyWith => __$HourlyForecastCopyWithImpl<_HourlyForecast>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HourlyForecastToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HourlyForecast&&(identical(other.forecastDateTime, forecastDateTime) || other.forecastDateTime == forecastDateTime)&&(identical(other.temperatureCelsius, temperatureCelsius) || other.temperatureCelsius == temperatureCelsius)&&(identical(other.skyConditionCode, skyConditionCode) || other.skyConditionCode == skyConditionCode)&&(identical(other.precipitationTypeCode, precipitationTypeCode) || other.precipitationTypeCode == precipitationTypeCode)&&(identical(other.precipitationProbabilityPercent, precipitationProbabilityPercent) || other.precipitationProbabilityPercent == precipitationProbabilityPercent)&&(identical(other.precipitationValue, precipitationValue) || other.precipitationValue == precipitationValue)&&(identical(other.snowValue, snowValue) || other.snowValue == snowValue)&&(identical(other.humidityPercent, humidityPercent) || other.humidityPercent == humidityPercent)&&(identical(other.windSpeedMps, windSpeedMps) || other.windSpeedMps == windSpeedMps)&&(identical(other.windDirectionDeg, windDirectionDeg) || other.windDirectionDeg == windDirectionDeg)&&(identical(other.windEastWestMps, windEastWestMps) || other.windEastWestMps == windEastWestMps)&&(identical(other.windNorthSouthMps, windNorthSouthMps) || other.windNorthSouthMps == windNorthSouthMps)&&(identical(other.waveHeightM, waveHeightM) || other.waveHeightM == waveHeightM));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,forecastDateTime,temperatureCelsius,skyConditionCode,precipitationTypeCode,precipitationProbabilityPercent,precipitationValue,snowValue,humidityPercent,windSpeedMps,windDirectionDeg,windEastWestMps,windNorthSouthMps,waveHeightM);

@override
String toString() {
  return 'HourlyForecast(forecastDateTime: $forecastDateTime, temperatureCelsius: $temperatureCelsius, skyConditionCode: $skyConditionCode, precipitationTypeCode: $precipitationTypeCode, precipitationProbabilityPercent: $precipitationProbabilityPercent, precipitationValue: $precipitationValue, snowValue: $snowValue, humidityPercent: $humidityPercent, windSpeedMps: $windSpeedMps, windDirectionDeg: $windDirectionDeg, windEastWestMps: $windEastWestMps, windNorthSouthMps: $windNorthSouthMps, waveHeightM: $waveHeightM)';
}


}

/// @nodoc
abstract mixin class _$HourlyForecastCopyWith<$Res> implements $HourlyForecastCopyWith<$Res> {
  factory _$HourlyForecastCopyWith(_HourlyForecast value, $Res Function(_HourlyForecast) _then) = __$HourlyForecastCopyWithImpl;
@override @useResult
$Res call({
 DateTime forecastDateTime, double? temperatureCelsius, String? skyConditionCode, String? precipitationTypeCode, int? precipitationProbabilityPercent, String? precipitationValue, String? snowValue, double? humidityPercent, double? windSpeedMps, int? windDirectionDeg, double? windEastWestMps, double? windNorthSouthMps, double? waveHeightM
});




}
/// @nodoc
class __$HourlyForecastCopyWithImpl<$Res>
    implements _$HourlyForecastCopyWith<$Res> {
  __$HourlyForecastCopyWithImpl(this._self, this._then);

  final _HourlyForecast _self;
  final $Res Function(_HourlyForecast) _then;

/// Create a copy of HourlyForecast
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? forecastDateTime = null,Object? temperatureCelsius = freezed,Object? skyConditionCode = freezed,Object? precipitationTypeCode = freezed,Object? precipitationProbabilityPercent = freezed,Object? precipitationValue = freezed,Object? snowValue = freezed,Object? humidityPercent = freezed,Object? windSpeedMps = freezed,Object? windDirectionDeg = freezed,Object? windEastWestMps = freezed,Object? windNorthSouthMps = freezed,Object? waveHeightM = freezed,}) {
  return _then(_HourlyForecast(
forecastDateTime: null == forecastDateTime ? _self.forecastDateTime : forecastDateTime // ignore: cast_nullable_to_non_nullable
as DateTime,temperatureCelsius: freezed == temperatureCelsius ? _self.temperatureCelsius : temperatureCelsius // ignore: cast_nullable_to_non_nullable
as double?,skyConditionCode: freezed == skyConditionCode ? _self.skyConditionCode : skyConditionCode // ignore: cast_nullable_to_non_nullable
as String?,precipitationTypeCode: freezed == precipitationTypeCode ? _self.precipitationTypeCode : precipitationTypeCode // ignore: cast_nullable_to_non_nullable
as String?,precipitationProbabilityPercent: freezed == precipitationProbabilityPercent ? _self.precipitationProbabilityPercent : precipitationProbabilityPercent // ignore: cast_nullable_to_non_nullable
as int?,precipitationValue: freezed == precipitationValue ? _self.precipitationValue : precipitationValue // ignore: cast_nullable_to_non_nullable
as String?,snowValue: freezed == snowValue ? _self.snowValue : snowValue // ignore: cast_nullable_to_non_nullable
as String?,humidityPercent: freezed == humidityPercent ? _self.humidityPercent : humidityPercent // ignore: cast_nullable_to_non_nullable
as double?,windSpeedMps: freezed == windSpeedMps ? _self.windSpeedMps : windSpeedMps // ignore: cast_nullable_to_non_nullable
as double?,windDirectionDeg: freezed == windDirectionDeg ? _self.windDirectionDeg : windDirectionDeg // ignore: cast_nullable_to_non_nullable
as int?,windEastWestMps: freezed == windEastWestMps ? _self.windEastWestMps : windEastWestMps // ignore: cast_nullable_to_non_nullable
as double?,windNorthSouthMps: freezed == windNorthSouthMps ? _self.windNorthSouthMps : windNorthSouthMps // ignore: cast_nullable_to_non_nullable
as double?,waveHeightM: freezed == waveHeightM ? _self.waveHeightM : waveHeightM // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
