import 'dart:convert'; // jsonDecode를 위해 필요
import 'dart:io'; // File 클래스를 위해 필요
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_angel/features/weather/data/model/kma_weather_api_response_dto.dart';
// DTO 파일의 실제 경로로 수정해주세요.
// 예: import 'package:my_weather_app/data/model/kma_weather_api_response_dto.dart';

void main() {
  // 테스트 그룹 정의
  group('KmaApiResponseDto Parsing Test', () {
    // 테스트 케이스 정의
    test('should correctly parse the KMA weather JSON from file', () async {
      // 1. JSON 파일 경로 지정 및 파일 읽기
      // Directory.current.path는 현재 프로젝트의 루트 디렉토리를 가리킵니다.
      final file = File('test/fixtures/api_weather.json');
      final jsonString = await file.readAsString();

      // 2. JSON 문자열을 Map<String, dynamic>으로 디코딩
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);

      // 3. DTO의 fromJson 팩토리 메소드를 사용하여 JSON 맵을 DTO 객체로 파싱
      //    파싱 과정에서 예외가 발생하지 않는지 확인하는 것이 중요합니다.
      KmaApiResponseDto? parsedDto;
      expect(() {
        // 익명 함수로 감싸서 예외 발생 여부 확인
        parsedDto = KmaApiResponseDto.fromJson(jsonMap);
      }, returnsNormally); // 'returnsNormally'은 해당 코드가 예외 없이 정상적으로 실행됨을 의미

      // 4. 파싱된 DTO 객체의 값들을 검증 (Assertions)
      // DTO 객체가 null이 아닌지 확인
      expect(parsedDto, isNotNull, reason: '파싱된 DTO 객체는 null이 아니어야 합니다.');

      // Header 정보 검증
      final header = parsedDto!.response.header;
      expect(
        header.resultCode,
        equals('00'),
        reason: 'resultCode는 "00"이어야 합니다.',
      );
      expect(
        header.resultMsg,
        equals('NORMAL_SERVICE'),
        reason: 'resultMsg는 "NORMAL_SERVICE"여야 합니다.',
      );

      // Body 정보 검증 (body는 nullable일 수 있으므로 null 체크)
      expect(
        parsedDto!.response.body,
        isNotNull,
        reason: 'Body 객체는 null이 아니어야 합니다.',
      );
      final body = parsedDto!.response.body!;
      expect(body.dataType, equals('JSON'), reason: 'dataType은 "JSON"이어야 합니다.');
      expect(body.pageNo, equals(1), reason: 'pageNo는 1이어야 합니다.');
      expect(body.numOfRows, equals(1000), reason: 'numOfRows는 1000이어야 합니다.');
      expect(body.totalCount, equals(871), reason: 'totalCount는 871이어야 합니다.');

      // Items 및 Item 리스트 검증
      expect(body.items, isNotNull, reason: 'Items 객체는 null이 아니어야 합니다.');
      expect(
        body.items.item,
        isA<List<KmaItemDto>>(),
        reason: 'item 필드는 List<KmaItemDto> 타입이어야 합니다.',
      );
      // 제공된 JSON의 totalCount와 실제 item 리스트의 길이가 일치하는지 확인 (페이지가 1개이고 모든 데이터를 포함한 경우)
      expect(
        body.items.item.length,
        equals(871),
        reason: 'item 리스트의 길이는 totalCount와 일치해야 합니다.',
      );

      // 리스트가 비어있지 않은지 확인 후, 첫 번째 아이템의 상세 값 검증
      if (body.items.item.isNotEmpty) {
        final firstItem = body.items.item[0];
        expect(
          firstItem.baseDate,
          equals('20250524'),
          reason: '첫 번째 아이템의 baseDate 검증',
        );
        expect(
          firstItem.baseTime,
          equals('0800'),
          reason: '첫 번째 아이템의 baseTime 검증',
        );
        expect(
          firstItem.category,
          equals('TMP'),
          reason: '첫 번째 아이템의 category 검증',
        );
        expect(
          firstItem.fcstDate,
          equals('20250524'),
          reason: '첫 번째 아이템의 fcstDate 검증',
        );
        expect(
          firstItem.fcstTime,
          equals('0900'),
          reason: '첫 번째 아이템의 fcstTime 검증',
        );
        expect(
          firstItem.fcstValue,
          equals('16'),
          reason: '첫 번째 아이템의 fcstValue 검증',
        ); // fcstValue는 문자열로 파싱됨
        expect(firstItem.nx, equals(55), reason: '첫 번째 아이템의 nx 검증');
        expect(firstItem.ny, equals(127), reason: '첫 번째 아이템의 ny 검증');

        // 두 번째 아이템의 category와 fcstValue 검증 (예시)
        final secondItem = body.items.item[1];
        expect(
          secondItem.category,
          equals('UUU'),
          reason: '두 번째 아이템의 category 검증',
        );
        expect(
          secondItem.fcstValue,
          equals('-2.5'),
          reason: '두 번째 아이템의 fcstValue 검증',
        );

        // 특정 조건의 아이템 검증 (예: 2025년 5월 24일 09시 예보의 PCP 값)
        final pcpItemForFirstFcstTime = body.items.item.firstWhere(
          (item) =>
              item.fcstDate == '20250524' &&
              item.fcstTime == '0900' &&
              item.category == 'PCP',
          orElse:
              () => throw StateError('09:00 PCP item not found'), // 테스트 실패 유도
        );
        expect(
          pcpItemForFirstFcstTime.fcstValue,
          equals('강수없음'),
          reason: '09시 PCP 값 검증',
        );

        // TMX 값 검증 (예: 2025년 5월 24일 15시 예보)
        final tmxItem = body.items.item.firstWhere(
          (item) =>
              item.fcstDate == '20250524' &&
              item.fcstTime == '1500' &&
              item.category == 'TMX',
          orElse: () => throw StateError('2025-05-24 15:00 TMX item not found'),
        );
        expect(tmxItem.fcstValue, equals('20.0'), reason: 'TMX (최고기온) 값 검증');
      } else {
        fail('items 리스트가 비어있습니다.'); // 리스트가 비어있다면 테스트 실패 처리
      }
    });
  });
}
