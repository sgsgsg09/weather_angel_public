import 'dart:convert'; // json.decode 사용
import 'dart:io'; // File 작업 사용
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_angel/features/weather/data/model/kma_weather_api_response_dto.dart';

// 사용자 정의 DTO 파일 경로 (실제 프로젝트 구조에 맞게 수정 필요)
// import 'package:your_project_name/kma_weather_api_response_dto.dart';

// fixture 리더 함수 정의 (테스트 파일 상단 또는 별도 파일에 위치 가능)
// 동기적으로 파일을 읽어 문자열로 반환합니다.
String fixture(String name) => File('test/fixtures/$name').readAsStringSync();

void main() {
  // 1. 예상되는 DTO 인스턴스 미리 정의 (Success Case)
  final tKmaItemDtoSuccess = KmaItemDto(
    baseDate: "20250524",
    baseTime: "2300",
    category: "TMP",
    fcstDate: "20250525",
    fcstTime: "0000",
    fcstValue: "11",
    nx: 92,
    ny: 131,
  );

  final tKmaItemsDtoSuccess = KmaItemsDto(item: [tKmaItemDtoSuccess]);

  final tKmaBodyDtoSuccess = KmaBodyDto(
    dataType: "JSON",
    items: tKmaItemsDtoSuccess,
    pageNo: 1,
    numOfRows: 1,
    totalCount: 980,
  );

  final tKmaHeaderDtoSuccess = KmaHeaderDto(
    resultCode: "00",
    resultMsg: "NORMAL_SERVICE",
  );

  final tKmaResponseDtoSuccess = KmaResponseDto(
    header: tKmaHeaderDtoSuccess,
    body: tKmaBodyDtoSuccess,
  );

  final tKmaApiResponseDtoSuccess = KmaApiResponseDto(
    response: tKmaResponseDtoSuccess,
  );

  // 2. 예상되는 DTO 인스턴스 미리 정의 (No Body Case)
  final tKmaHeaderDtoNoBody = KmaHeaderDto(
    resultCode: "03",
    resultMsg: "NO_DATA",
  );

  final tKmaResponseDtoNoBody = KmaResponseDto(
    header: tKmaHeaderDtoNoBody,
    body: null, // body가 없는 경우
  );

  final tKmaApiResponseDtoNoBody = KmaApiResponseDto(
    response: tKmaResponseDtoNoBody,
  );

  group('fromJson', () {
    test(
      'JSON 응답이 정상적일 때(body 포함), 유효한 KmaApiResponseDto 모델을 반환해야 합니다.',
      () async {
        // arrange
        // fixture 함수를 통해 JSON 파일을 문자열로 읽고, json.decode로 Map<String, dynamic>으로 변환
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('kma_weather_success_response.json'))
                as Map<String, dynamic>;
        // act
        final result = KmaApiResponseDto.fromJson(jsonMap);
        // assert
        // 미리 정의된 예상 DTO 인스턴스와 값 동등성 비교
        // (freezed가 operator== 및 hashCode를 자동으로 구현해줌)
        expect(result, tKmaApiResponseDtoSuccess);
      },
    );

    test(
      'JSON 응답에 body가 없을 때, body가 null인 유효한 KmaApiResponseDto 모델을 반환해야 합니다.',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('kma_weather_no_body_response.json'))
                as Map<String, dynamic>;
        // act
        final result = KmaApiResponseDto.fromJson(jsonMap);
        // assert
        expect(result, tKmaApiResponseDtoNoBody);
      },
    );
  });

  group('toJson', () {
    test(
      '정상적인 KmaApiResponseDto 모델(body 포함)에서 toJson 호출 시, 올바른 JSON 맵을 반환해야 합니다.',
      () async {
        // act
        // 미리 정의된 DTO 인스턴스(tKmaApiResponseDtoSuccess)에서 toJson 호출
        final result = tKmaApiResponseDtoSuccess.toJson();
        // assert
        // 예상되는 JSON 맵 구조를 직접 작성하여 비교
        final expectedMap = {
          "response": {
            "header": {"resultCode": "00", "resultMsg": "NORMAL_SERVICE"},
            "body": {
              "dataType": "JSON",
              "items": {
                "item": [
                  {
                    "baseDate": "20250524",
                    "baseTime": "2300",
                    "category": "TMP",
                    "fcstDate": "20250525",
                    "fcstTime": "0000",
                    "fcstValue": "11",
                    "nx": 92,
                    "ny": 131,
                  },
                ],
              },
              "pageNo": 1,
              "numOfRows": 1,
              "totalCount": 980,
            },
          },
        };
        expect(result, expectedMap);
      },
    );

    test(
      'body가 null인 KmaApiResponseDto 모델에서 toJson 호출 시, body 필드가 없는 (또는 null인) JSON 맵을 반환해야 합니다.',
      () async {
        // act
        final result = tKmaApiResponseDtoNoBody.toJson();
        // assert
        final expectedMap = {
          "response": {
            "header": {"resultCode": "03", "resultMsg": "NO_DATA"},
            "body": null, // null 값을 명시적으로 포함 (json_serializable의 기본 동작)
          },
        };
        expect(result, expectedMap);
      },
    );
  });
}
