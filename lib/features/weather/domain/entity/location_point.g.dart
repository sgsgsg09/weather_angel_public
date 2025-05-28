// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationPoint _$LocationPointFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_LocationPoint', json, ($checkedConvert) {
      final val = _LocationPoint(
        nx: $checkedConvert('nx', (v) => (v as num).toInt()),
        ny: $checkedConvert('ny', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$LocationPointToJson(_LocationPoint instance) =>
    <String, dynamic>{'nx': instance.nx, 'ny': instance.ny};
