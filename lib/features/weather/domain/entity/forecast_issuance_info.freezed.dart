// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forecast_issuance_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForecastIssuanceInfo {

 String get baseDate;// 발표일자 (YYYYMMDD)
 String get baseTime;
/// Create a copy of ForecastIssuanceInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForecastIssuanceInfoCopyWith<ForecastIssuanceInfo> get copyWith => _$ForecastIssuanceInfoCopyWithImpl<ForecastIssuanceInfo>(this as ForecastIssuanceInfo, _$identity);

  /// Serializes this ForecastIssuanceInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForecastIssuanceInfo&&(identical(other.baseDate, baseDate) || other.baseDate == baseDate)&&(identical(other.baseTime, baseTime) || other.baseTime == baseTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseDate,baseTime);

@override
String toString() {
  return 'ForecastIssuanceInfo(baseDate: $baseDate, baseTime: $baseTime)';
}


}

/// @nodoc
abstract mixin class $ForecastIssuanceInfoCopyWith<$Res>  {
  factory $ForecastIssuanceInfoCopyWith(ForecastIssuanceInfo value, $Res Function(ForecastIssuanceInfo) _then) = _$ForecastIssuanceInfoCopyWithImpl;
@useResult
$Res call({
 String baseDate, String baseTime
});




}
/// @nodoc
class _$ForecastIssuanceInfoCopyWithImpl<$Res>
    implements $ForecastIssuanceInfoCopyWith<$Res> {
  _$ForecastIssuanceInfoCopyWithImpl(this._self, this._then);

  final ForecastIssuanceInfo _self;
  final $Res Function(ForecastIssuanceInfo) _then;

/// Create a copy of ForecastIssuanceInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baseDate = null,Object? baseTime = null,}) {
  return _then(_self.copyWith(
baseDate: null == baseDate ? _self.baseDate : baseDate // ignore: cast_nullable_to_non_nullable
as String,baseTime: null == baseTime ? _self.baseTime : baseTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ForecastIssuanceInfo implements ForecastIssuanceInfo {
  const _ForecastIssuanceInfo({required this.baseDate, required this.baseTime});
  factory _ForecastIssuanceInfo.fromJson(Map<String, dynamic> json) => _$ForecastIssuanceInfoFromJson(json);

@override final  String baseDate;
// 발표일자 (YYYYMMDD)
@override final  String baseTime;

/// Create a copy of ForecastIssuanceInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForecastIssuanceInfoCopyWith<_ForecastIssuanceInfo> get copyWith => __$ForecastIssuanceInfoCopyWithImpl<_ForecastIssuanceInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForecastIssuanceInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForecastIssuanceInfo&&(identical(other.baseDate, baseDate) || other.baseDate == baseDate)&&(identical(other.baseTime, baseTime) || other.baseTime == baseTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseDate,baseTime);

@override
String toString() {
  return 'ForecastIssuanceInfo(baseDate: $baseDate, baseTime: $baseTime)';
}


}

/// @nodoc
abstract mixin class _$ForecastIssuanceInfoCopyWith<$Res> implements $ForecastIssuanceInfoCopyWith<$Res> {
  factory _$ForecastIssuanceInfoCopyWith(_ForecastIssuanceInfo value, $Res Function(_ForecastIssuanceInfo) _then) = __$ForecastIssuanceInfoCopyWithImpl;
@override @useResult
$Res call({
 String baseDate, String baseTime
});




}
/// @nodoc
class __$ForecastIssuanceInfoCopyWithImpl<$Res>
    implements _$ForecastIssuanceInfoCopyWith<$Res> {
  __$ForecastIssuanceInfoCopyWithImpl(this._self, this._then);

  final _ForecastIssuanceInfo _self;
  final $Res Function(_ForecastIssuanceInfo) _then;

/// Create a copy of ForecastIssuanceInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baseDate = null,Object? baseTime = null,}) {
  return _then(_ForecastIssuanceInfo(
baseDate: null == baseDate ? _self.baseDate : baseDate // ignore: cast_nullable_to_non_nullable
as String,baseTime: null == baseTime ? _self.baseTime : baseTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
