// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherForecastData _$WeatherForecastDataFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_WeatherForecastData', json, ($checkedConvert) {
  final val = _WeatherForecastData(
    location: $checkedConvert(
      'location',
      (v) => LocationPoint.fromJson(v as Map<String, dynamic>),
    ),
    issuanceInfo: $checkedConvert(
      'issuanceInfo',
      (v) => ForecastIssuanceInfo.fromJson(v as Map<String, dynamic>),
    ),
    hourlyForecasts: $checkedConvert(
      'hourlyForecasts',
      (v) =>
          (v as List<dynamic>)
              .map((e) => HourlyForecast.fromJson(e as Map<String, dynamic>))
              .toList(),
    ),
    dailyForecasts: $checkedConvert(
      'dailyForecasts',
      (v) =>
          (v as List<dynamic>)
              .map((e) => DailyForecast.fromJson(e as Map<String, dynamic>))
              .toList(),
    ),
    currentWeather: $checkedConvert(
      'currentWeather',
      (v) =>
          v == null ? null : HourlyForecast.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$WeatherForecastDataToJson(
  _WeatherForecastData instance,
) => <String, dynamic>{
  'location': instance.location,
  'issuanceInfo': instance.issuanceInfo,
  'hourlyForecasts': instance.hourlyForecasts,
  'dailyForecasts': instance.dailyForecasts,
  'currentWeather': instance.currentWeather,
};
