import 'package:freezed_annotation/freezed_annotation.dart';

part 'kma_weather_api_response_dto.freezed.dart';
part 'kma_weather_api_response_dto.g.dart';

// 최상위 응답 구조
@freezed
abstract class KmaApiResponseDto with _$KmaApiResponseDto {
  @JsonSerializable(explicitToJson: true)
  const factory KmaApiResponseDto({required KmaResponseDto response}) =
      _KmaApiResponseDto;

  factory KmaApiResponseDto.fromJson(Map<String, dynamic> json) =>
      _$KmaApiResponseDtoFromJson(json);
}

// "response" 객체
@freezed
abstract class KmaResponseDto with _$KmaResponseDto {
  @JsonSerializable(explicitToJson: true)
  const factory KmaResponseDto({
    required KmaHeaderDto header,
    KmaBodyDto? body, // 오류 시 body가 없을 수 있음
  }) = _KmaResponseDto;

  factory KmaResponseDto.fromJson(Map<String, dynamic> json) =>
      _$KmaResponseDtoFromJson(json);
}

// "header" 객체
@freezed
abstract class KmaHeaderDto with _$KmaHeaderDto {
  const factory KmaHeaderDto({
    required String resultCode,
    required String resultMsg,
  }) = _KmaHeaderDto;

  factory KmaHeaderDto.fromJson(Map<String, dynamic> json) =>
      _$KmaHeaderDtoFromJson(json);
}

// "body" 객체
@freezed
abstract class KmaBodyDto with _$KmaBodyDto {
  @JsonSerializable(explicitToJson: true)
  const factory KmaBodyDto({
    required String dataType,
    required KmaItemsDto items,
    required int pageNo,
    required int numOfRows,
    required int totalCount,
  }) = _KmaBodyDto;

  factory KmaBodyDto.fromJson(Map<String, dynamic> json) =>
      _$KmaBodyDtoFromJson(json);
}

// "items" 객체
@freezed
abstract class KmaItemsDto with _$KmaItemsDto {
  @JsonSerializable(explicitToJson: true)
  const factory KmaItemsDto({
    // API에서 item이 단일 객체일 경우도 있고, 여러 개일 경우 리스트일 수 있습니다.
    // 일반적으로 리스트로 오므로 List<KmaItemDto>로 처리합니다.
    // 만약 단일 객체인데 List로 파싱하려고 하면 에러가 발생할 수 있으니,
    // 실제 API 명세에 따라 List<KmaItemDto> 또는 KmaItemDto 단일 객체로 변경해야 합니다.
    // 제공된 JSON에서는 List<KmaItemDto>가 맞습니다.
    required List<KmaItemDto> item,
  }) = _KmaItemsDto;

  factory KmaItemsDto.fromJson(Map<String, dynamic> json) =>
      _$KmaItemsDtoFromJson(json);
}

// 개별 예보 항목 ("item" 객체)
@freezed
abstract class KmaItemDto with _$KmaItemDto {
  const factory KmaItemDto({
    required String baseDate, // 발표일자 (YYYYMMDD)
    required String baseTime, // 발표시각 (HHMM)
    required String category, // 자료구분코드 (TMP, POP, SKY 등)
    required String fcstDate, // 예보일자 (YYYYMMDD)
    required String fcstTime, // 예보시각 (HHMM)
    required String fcstValue, // 예보 값 (문자열이므로 파싱 필요)
    required int nx, // 예보지점 X 좌표
    required int ny, // 예보지점 Y 좌표
  }) = _KmaItemDto;

  factory KmaItemDto.fromJson(Map<String, dynamic> json) =>
      _$KmaItemDtoFromJson(json);
}
