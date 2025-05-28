// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_forecast_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherForecastData {

 LocationPoint get location;// 예보 위치 (nx, ny)
 ForecastIssuanceInfo get issuanceInfo;// 예보 발표 정보
 List<HourlyForecast> get hourlyForecasts; List<DailyForecast> get dailyForecasts;// 현재 날씨는 hourlyForecasts의 첫 번째 항목 또는 별도 실황 API로 구성 가능
 HourlyForecast? get currentWeather;
/// Create a copy of WeatherForecastData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherForecastDataCopyWith<WeatherForecastData> get copyWith => _$WeatherForecastDataCopyWithImpl<WeatherForecastData>(this as WeatherForecastData, _$identity);

  /// Serializes this WeatherForecastData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherForecastData&&(identical(other.location, location) || other.location == location)&&(identical(other.issuanceInfo, issuanceInfo) || other.issuanceInfo == issuanceInfo)&&const DeepCollectionEquality().equals(other.hourlyForecasts, hourlyForecasts)&&const DeepCollectionEquality().equals(other.dailyForecasts, dailyForecasts)&&(identical(other.currentWeather, currentWeather) || other.currentWeather == currentWeather));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,location,issuanceInfo,const DeepCollectionEquality().hash(hourlyForecasts),const DeepCollectionEquality().hash(dailyForecasts),currentWeather);

@override
String toString() {
  return 'WeatherForecastData(location: $location, issuanceInfo: $issuanceInfo, hourlyForecasts: $hourlyForecasts, dailyForecasts: $dailyForecasts, currentWeather: $currentWeather)';
}


}

/// @nodoc
abstract mixin class $WeatherForecastDataCopyWith<$Res>  {
  factory $WeatherForecastDataCopyWith(WeatherForecastData value, $Res Function(WeatherForecastData) _then) = _$WeatherForecastDataCopyWithImpl;
@useResult
$Res call({
 LocationPoint location, ForecastIssuanceInfo issuanceInfo, List<HourlyForecast> hourlyForecasts, List<DailyForecast> dailyForecasts, HourlyForecast? currentWeather
});


$LocationPointCopyWith<$Res> get location;$ForecastIssuanceInfoCopyWith<$Res> get issuanceInfo;$HourlyForecastCopyWith<$Res>? get currentWeather;

}
/// @nodoc
class _$WeatherForecastDataCopyWithImpl<$Res>
    implements $WeatherForecastDataCopyWith<$Res> {
  _$WeatherForecastDataCopyWithImpl(this._self, this._then);

  final WeatherForecastData _self;
  final $Res Function(WeatherForecastData) _then;

/// Create a copy of WeatherForecastData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? location = null,Object? issuanceInfo = null,Object? hourlyForecasts = null,Object? dailyForecasts = null,Object? currentWeather = freezed,}) {
  return _then(_self.copyWith(
location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationPoint,issuanceInfo: null == issuanceInfo ? _self.issuanceInfo : issuanceInfo // ignore: cast_nullable_to_non_nullable
as ForecastIssuanceInfo,hourlyForecasts: null == hourlyForecasts ? _self.hourlyForecasts : hourlyForecasts // ignore: cast_nullable_to_non_nullable
as List<HourlyForecast>,dailyForecasts: null == dailyForecasts ? _self.dailyForecasts : dailyForecasts // ignore: cast_nullable_to_non_nullable
as List<DailyForecast>,currentWeather: freezed == currentWeather ? _self.currentWeather : currentWeather // ignore: cast_nullable_to_non_nullable
as HourlyForecast?,
  ));
}
/// Create a copy of WeatherForecastData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationPointCopyWith<$Res> get location {
  
  return $LocationPointCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of WeatherForecastData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ForecastIssuanceInfoCopyWith<$Res> get issuanceInfo {
  
  return $ForecastIssuanceInfoCopyWith<$Res>(_self.issuanceInfo, (value) {
    return _then(_self.copyWith(issuanceInfo: value));
  });
}/// Create a copy of WeatherForecastData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HourlyForecastCopyWith<$Res>? get currentWeather {
    if (_self.currentWeather == null) {
    return null;
  }

  return $HourlyForecastCopyWith<$Res>(_self.currentWeather!, (value) {
    return _then(_self.copyWith(currentWeather: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _WeatherForecastData implements WeatherForecastData {
  const _WeatherForecastData({required this.location, required this.issuanceInfo, required final  List<HourlyForecast> hourlyForecasts, required final  List<DailyForecast> dailyForecasts, this.currentWeather}): _hourlyForecasts = hourlyForecasts,_dailyForecasts = dailyForecasts;
  factory _WeatherForecastData.fromJson(Map<String, dynamic> json) => _$WeatherForecastDataFromJson(json);

@override final  LocationPoint location;
// 예보 위치 (nx, ny)
@override final  ForecastIssuanceInfo issuanceInfo;
// 예보 발표 정보
 final  List<HourlyForecast> _hourlyForecasts;
// 예보 발표 정보
@override List<HourlyForecast> get hourlyForecasts {
  if (_hourlyForecasts is EqualUnmodifiableListView) return _hourlyForecasts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hourlyForecasts);
}

 final  List<DailyForecast> _dailyForecasts;
@override List<DailyForecast> get dailyForecasts {
  if (_dailyForecasts is EqualUnmodifiableListView) return _dailyForecasts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dailyForecasts);
}

// 현재 날씨는 hourlyForecasts의 첫 번째 항목 또는 별도 실황 API로 구성 가능
@override final  HourlyForecast? currentWeather;

/// Create a copy of WeatherForecastData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherForecastDataCopyWith<_WeatherForecastData> get copyWith => __$WeatherForecastDataCopyWithImpl<_WeatherForecastData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherForecastDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherForecastData&&(identical(other.location, location) || other.location == location)&&(identical(other.issuanceInfo, issuanceInfo) || other.issuanceInfo == issuanceInfo)&&const DeepCollectionEquality().equals(other._hourlyForecasts, _hourlyForecasts)&&const DeepCollectionEquality().equals(other._dailyForecasts, _dailyForecasts)&&(identical(other.currentWeather, currentWeather) || other.currentWeather == currentWeather));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,location,issuanceInfo,const DeepCollectionEquality().hash(_hourlyForecasts),const DeepCollectionEquality().hash(_dailyForecasts),currentWeather);

@override
String toString() {
  return 'WeatherForecastData(location: $location, issuanceInfo: $issuanceInfo, hourlyForecasts: $hourlyForecasts, dailyForecasts: $dailyForecasts, currentWeather: $currentWeather)';
}


}

/// @nodoc
abstract mixin class _$WeatherForecastDataCopyWith<$Res> implements $WeatherForecastDataCopyWith<$Res> {
  factory _$WeatherForecastDataCopyWith(_WeatherForecastData value, $Res Function(_WeatherForecastData) _then) = __$WeatherForecastDataCopyWithImpl;
@override @useResult
$Res call({
 LocationPoint location, ForecastIssuanceInfo issuanceInfo, List<HourlyForecast> hourlyForecasts, List<DailyForecast> dailyForecasts, HourlyForecast? currentWeather
});


@override $LocationPointCopyWith<$Res> get location;@override $ForecastIssuanceInfoCopyWith<$Res> get issuanceInfo;@override $HourlyForecastCopyWith<$Res>? get currentWeather;

}
/// @nodoc
class __$WeatherForecastDataCopyWithImpl<$Res>
    implements _$WeatherForecastDataCopyWith<$Res> {
  __$WeatherForecastDataCopyWithImpl(this._self, this._then);

  final _WeatherForecastData _self;
  final $Res Function(_WeatherForecastData) _then;

/// Create a copy of WeatherForecastData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? location = null,Object? issuanceInfo = null,Object? hourlyForecasts = null,Object? dailyForecasts = null,Object? currentWeather = freezed,}) {
  return _then(_WeatherForecastData(
location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationPoint,issuanceInfo: null == issuanceInfo ? _self.issuanceInfo : issuanceInfo // ignore: cast_nullable_to_non_nullable
as ForecastIssuanceInfo,hourlyForecasts: null == hourlyForecasts ? _self._hourlyForecasts : hourlyForecasts // ignore: cast_nullable_to_non_nullable
as List<HourlyForecast>,dailyForecasts: null == dailyForecasts ? _self._dailyForecasts : dailyForecasts // ignore: cast_nullable_to_non_nullable
as List<DailyForecast>,currentWeather: freezed == currentWeather ? _self.currentWeather : currentWeather // ignore: cast_nullable_to_non_nullable
as HourlyForecast?,
  ));
}

/// Create a copy of WeatherForecastData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationPointCopyWith<$Res> get location {
  
  return $LocationPointCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of WeatherForecastData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ForecastIssuanceInfoCopyWith<$Res> get issuanceInfo {
  
  return $ForecastIssuanceInfoCopyWith<$Res>(_self.issuanceInfo, (value) {
    return _then(_self.copyWith(issuanceInfo: value));
  });
}/// Create a copy of WeatherForecastData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HourlyForecastCopyWith<$Res>? get currentWeather {
    if (_self.currentWeather == null) {
    return null;
  }

  return $HourlyForecastCopyWith<$Res>(_self.currentWeather!, (value) {
    return _then(_self.copyWith(currentWeather: value));
  });
}
}

// dart format on
