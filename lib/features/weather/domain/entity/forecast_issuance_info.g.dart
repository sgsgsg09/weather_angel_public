// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_issuance_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForecastIssuanceInfo _$ForecastIssuanceInfoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ForecastIssuanceInfo', json, ($checkedConvert) {
  final val = _ForecastIssuanceInfo(
    baseDate: $checkedConvert('baseDate', (v) => v as String),
    baseTime: $checkedConvert('baseTime', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$ForecastIssuanceInfoToJson(
  _ForecastIssuanceInfo instance,
) => <String, dynamic>{
  'baseDate': instance.baseDate,
  'baseTime': instance.baseTime,
};
