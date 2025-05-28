// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kma_weather_api_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KmaApiResponseDto _$KmaApiResponseDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_KmaApiResponseDto', json, ($checkedConvert) {
      final val = _KmaApiResponseDto(
        response: $checkedConvert(
          'response',
          (v) => KmaResponseDto.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$KmaApiResponseDtoToJson(_KmaApiResponseDto instance) =>
    <String, dynamic>{'response': instance.response.toJson()};

_KmaResponseDto _$KmaResponseDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_KmaResponseDto', json, ($checkedConvert) {
      final val = _KmaResponseDto(
        header: $checkedConvert(
          'header',
          (v) => KmaHeaderDto.fromJson(v as Map<String, dynamic>),
        ),
        body: $checkedConvert(
          'body',
          (v) =>
              v == null ? null : KmaBodyDto.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$KmaResponseDtoToJson(_KmaResponseDto instance) =>
    <String, dynamic>{
      'header': instance.header.toJson(),
      'body': instance.body?.toJson(),
    };

_KmaHeaderDto _$KmaHeaderDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_KmaHeaderDto', json, ($checkedConvert) {
      final val = _KmaHeaderDto(
        resultCode: $checkedConvert('resultCode', (v) => v as String),
        resultMsg: $checkedConvert('resultMsg', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$KmaHeaderDtoToJson(_KmaHeaderDto instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
    };

_KmaBodyDto _$KmaBodyDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_KmaBodyDto', json, ($checkedConvert) {
      final val = _KmaBodyDto(
        dataType: $checkedConvert('dataType', (v) => v as String),
        items: $checkedConvert(
          'items',
          (v) => KmaItemsDto.fromJson(v as Map<String, dynamic>),
        ),
        pageNo: $checkedConvert('pageNo', (v) => (v as num).toInt()),
        numOfRows: $checkedConvert('numOfRows', (v) => (v as num).toInt()),
        totalCount: $checkedConvert('totalCount', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$KmaBodyDtoToJson(_KmaBodyDto instance) =>
    <String, dynamic>{
      'dataType': instance.dataType,
      'items': instance.items.toJson(),
      'pageNo': instance.pageNo,
      'numOfRows': instance.numOfRows,
      'totalCount': instance.totalCount,
    };

_KmaItemsDto _$KmaItemsDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_KmaItemsDto', json, ($checkedConvert) {
      final val = _KmaItemsDto(
        item: $checkedConvert(
          'item',
          (v) =>
              (v as List<dynamic>)
                  .map((e) => KmaItemDto.fromJson(e as Map<String, dynamic>))
                  .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$KmaItemsDtoToJson(_KmaItemsDto instance) =>
    <String, dynamic>{'item': instance.item.map((e) => e.toJson()).toList()};

_KmaItemDto _$KmaItemDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_KmaItemDto', json, ($checkedConvert) {
      final val = _KmaItemDto(
        baseDate: $checkedConvert('baseDate', (v) => v as String),
        baseTime: $checkedConvert('baseTime', (v) => v as String),
        category: $checkedConvert('category', (v) => v as String),
        fcstDate: $checkedConvert('fcstDate', (v) => v as String),
        fcstTime: $checkedConvert('fcstTime', (v) => v as String),
        fcstValue: $checkedConvert('fcstValue', (v) => v as String),
        nx: $checkedConvert('nx', (v) => (v as num).toInt()),
        ny: $checkedConvert('ny', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$KmaItemDtoToJson(_KmaItemDto instance) =>
    <String, dynamic>{
      'baseDate': instance.baseDate,
      'baseTime': instance.baseTime,
      'category': instance.category,
      'fcstDate': instance.fcstDate,
      'fcstTime': instance.fcstTime,
      'fcstValue': instance.fcstValue,
      'nx': instance.nx,
      'ny': instance.ny,
    };
