// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HourlyForecast _$HourlyForecastFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_HourlyForecast', json, ($checkedConvert) {
  final val = _HourlyForecast(
    forecastDateTime: $checkedConvert(
      'forecastDateTime',
      (v) => DateTime.parse(v as String),
    ),
    temperatureCelsius: $checkedConvert(
      'temperatureCelsius',
      (v) => (v as num?)?.toDouble(),
    ),
    skyConditionCode: $checkedConvert('skyConditionCode', (v) => v as String?),
    precipitationTypeCode: $checkedConvert(
      'precipitationTypeCode',
      (v) => v as String?,
    ),
    precipitationProbabilityPercent: $checkedConvert(
      'precipitationProbabilityPercent',
      (v) => (v as num?)?.toInt(),
    ),
    precipitationValue: $checkedConvert(
      'precipitationValue',
      (v) => v as String?,
    ),
    snowValue: $checkedConvert('snowValue', (v) => v as String?),
    humidityPercent: $checkedConvert(
      'humidityPercent',
      (v) => (v as num?)?.toDouble(),
    ),
    windSpeedMps: $checkedConvert(
      'windSpeedMps',
      (v) => (v as num?)?.toDouble(),
    ),
    windDirectionDeg: $checkedConvert(
      'windDirectionDeg',
      (v) => (v as num?)?.toInt(),
    ),
    windEastWestMps: $checkedConvert(
      'windEastWestMps',
      (v) => (v as num?)?.toDouble(),
    ),
    windNorthSouthMps: $checkedConvert(
      'windNorthSouthMps',
      (v) => (v as num?)?.toDouble(),
    ),
    waveHeightM: $checkedConvert('waveHeightM', (v) => (v as num?)?.toDouble()),
  );
  return val;
});

Map<String, dynamic> _$HourlyForecastToJson(
  _HourlyForecast instance,
) => <String, dynamic>{
  'forecastDateTime': instance.forecastDateTime.toIso8601String(),
  'temperatureCelsius': instance.temperatureCelsius,
  'skyConditionCode': instance.skyConditionCode,
  'precipitationTypeCode': instance.precipitationTypeCode,
  'precipitationProbabilityPercent': instance.precipitationProbabilityPercent,
  'precipitationValue': instance.precipitationValue,
  'snowValue': instance.snowValue,
  'humidityPercent': instance.humidityPercent,
  'windSpeedMps': instance.windSpeedMps,
  'windDirectionDeg': instance.windDirectionDeg,
  'windEastWestMps': instance.windEastWestMps,
  'windNorthSouthMps': instance.windNorthSouthMps,
  'waveHeightM': instance.waveHeightM,
};
