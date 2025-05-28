// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DailyForecast _$DailyForecastFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_DailyForecast', json, ($checkedConvert) {
      final val = _DailyForecast(
        date: $checkedConvert('date', (v) => DateTime.parse(v as String)),
        minTemperatureCelsius: $checkedConvert(
          'minTemperatureCelsius',
          (v) => (v as num?)?.toDouble(),
        ),
        maxTemperatureCelsius: $checkedConvert(
          'maxTemperatureCelsius',
          (v) => (v as num?)?.toDouble(),
        ),
        precipitationProbabilityAvgPercent: $checkedConvert(
          'precipitationProbabilityAvgPercent',
          (v) => (v as num?)?.toInt(),
        ),
        overallSkyConditionCode: $checkedConvert(
          'overallSkyConditionCode',
          (v) => v as String?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$DailyForecastToJson(_DailyForecast instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'minTemperatureCelsius': instance.minTemperatureCelsius,
      'maxTemperatureCelsius': instance.maxTemperatureCelsius,
      'precipitationProbabilityAvgPercent':
          instance.precipitationProbabilityAvgPercent,
      'overallSkyConditionCode': instance.overallSkyConditionCode,
    };
