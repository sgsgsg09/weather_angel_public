import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';
import 'package:weather_angel/core/error/exceptions.dart';
import 'package:weather_angel/features/weather/data/model/kma_weather_api_response_dto.dart';

abstract class WeatherRemoteDataSource {
  Future<KmaApiResponseDto> getWeatherForecastFromApi({
    required int nx,
    required int ny,
    String? baseDate, // 특정 발표일자 조회를 위한 선택적 파라미터
    String? baseTime, // 특정 발표시각 조회를 위한 선택적 파라미터
    // API에 따라 필요한 다른 파라미터들 (예: pageNo, numOfRows 등)은
    // 구현체 내부에서 관리하거나, 필요시 인터페이스에 추가할 수 있습니다.
  });
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;
  final String apiKey;

  // 기상청 동네예보 API 기본 URL (getVilageFcst 기준)
  static const String _baseUrl =
      'https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0';

  // 기상청 단기예보 발표 시각 (KST 기준 시)
  static const List<int> _kmaBaseHoursKST = [2, 5, 8, 11, 14, 17, 20, 23];
  // API 자료 제공 지연 시간 (분 단위, 여유 있게 설정)
  static const int _apiDataProvisionDelayMinutes = 15;

  WeatherRemoteDataSourceImpl({required this.client, required this.apiKey}) {
    print('Initialized WeatherRemoteDataSourceImpl with apiKey: $apiKey');
  } // 생성자에서 출력};

  /// 현재 시점을 기준으로 KMA API에서 조회 가능한 가장 최신의 base_date와 base_time을 계산합니다.
  /// KMA 단기예보는 특정 시간에 발표되며, 약간의 지연 후 제공됩니다.
  Map<String, String> _getLatestAvailableBaseDateTime() {
    // DateTime.now()는 시스템의 로컬 시간대를 사용합니다.
    // KMA API는 KST 기준이므로, 서버/앱 실행 환경이 KST가 아닌 경우 정확한 KST 시각을 사용해야 합니다.
    // 여기서는 DateTime.now()가 KST와 유사한 환경이거나, 다른 곳에서 KST로 변환되었다고 가정합니다.
    // 정확성을 위해서는 `package:timezone`을 사용하여 명시적으로 KST를 다루는 것이 좋습니다.
    // 예: final kst = tz.getLocation('Asia/Seoul');
    //     DateTime nowInKst = tz.TZDateTime.now(kst);
    DateTime now = DateTime.now();

    // API 자료 제공 지연 시간을 고려하여 기준 시각을 약간 과거로 설정
    DateTime referenceTime = now.subtract(
      const Duration(minutes: _apiDataProvisionDelayMinutes),
    );

    String baseDateStr = DateFormat('yyyyMMdd').format(referenceTime);
    int currentHour = referenceTime.hour;
    String baseTimeStr = '';

    // 현재 시간보다 이전이면서 가장 가까운 발표 시각 찾기
    for (int i = _kmaBaseHoursKST.length - 1; i >= 0; i--) {
      if (currentHour >= _kmaBaseHoursKST[i]) {
        baseTimeStr = '${_kmaBaseHoursKST[i].toString().padLeft(2, '0')}00';
        break;
      }
    }

    // 만약 오늘 중 적합한 발표 시각이 없다면 (예: 새벽 1시이고, 2시 발표 자료는 아직 미생성)
    // 어제의 마지막 발표 시각(23시)을 사용
    if (baseTimeStr.isEmpty) {
      DateTime yesterdayReference = referenceTime.subtract(
        const Duration(days: 1),
      );
      baseDateStr = DateFormat('yyyyMMdd').format(yesterdayReference);
      baseTimeStr =
          '${_kmaBaseHoursKST.last.toString().padLeft(2, '0')}00'; // 2300
    }

    return {'baseDate': baseDateStr, 'baseTime': baseTimeStr};
  }

  @override
  Future<KmaApiResponseDto> getWeatherForecastFromApi({
    required int nx,
    required int ny,
    String? baseDate,
    String? baseTime,
  }) async {
    String actualBaseDate;
    String actualBaseTime;
    print('Using apiKey in getWeatherForecastFromApi: $apiKey'); // 메서드 호출 시 출력

    // baseDate 또는 baseTime이 제공되지 않으면 최신 발표 시각 사용
    if (baseDate == null ||
        baseDate.isEmpty ||
        baseTime == null ||
        baseTime.isEmpty) {
      final latestDateTime = _getLatestAvailableBaseDateTime();
      actualBaseDate = latestDateTime['baseDate']!;
      actualBaseTime = latestDateTime['baseTime']!;
    } else {
      actualBaseDate = baseDate;
      actualBaseTime = baseTime;
    }

    final queryParameters = {
      'serviceKey': apiKey,
      'pageNo': '1',
      'numOfRows': '1000', // 단일 위치, 단일 발표시각의 모든 항목을 가져오기에 충분한 값
      'dataType': 'JSON',
      'base_date': actualBaseDate,
      'base_time': actualBaseTime,
      'nx': nx.toString(),
      'ny': ny.toString(),
    };

    final uri = Uri.parse(
      '$_baseUrl/getVilageFcst',
    ).replace(queryParameters: queryParameters);
    // print('Requesting API: $uri'); // 디버깅용

    print('Requesting KMA API URL: $uri');
    http.Response response;
    try {
      response = await client
          .get(
            uri,
            headers: {'Accept': 'application/json'}, // JSON 응답 요청
          )
          .timeout(const Duration(seconds: 10)); // 타임아웃 설정

      print('KMA API Response Body: ${response.body}'); // <--- 실제 응답 본문 출력!!!
      print('KMA API Response Status Code: ${response.statusCode}');
    } on SocketException catch (e) {
      throw NetworkException(
        message:
            '네트워크 오류: KMA 서버 연결에 실패했습니다. (${e.osError?.message ?? e.message})',
      );
    } on TimeoutException catch (e) {
      throw NetworkException(message: '네트워크 오류: 요청 시간이 초과되었습니다.');
    } catch (e) {
      // 기타 클라이언트 측 HTTP 요청 오류
      throw NetworkException(message: '네트워크 요청 실패: ${e.toString()}');
    }

    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        final kmaApiResponseDto = KmaApiResponseDto.fromJson(jsonResponse);

        // API 자체 응답 헤더의 결과 코드 확인
        if (kmaApiResponseDto.response.header.resultCode == '00') {
          // 성공 ("00")이지만 body나 items가 비정상적인 경우에 대한 추가 방어 로직은
          // Mapper에서 NoDataException을 던지도록 처리하거나 여기서도 가능합니다.
          // 예: if (kmaApiResponseDto.response.body?.items.item.isEmpty ?? true) {
          //   throw NoDataException('API 응답 성공(00)했으나 유효한 데이터 항목이 없습니다.');
          // }
          return kmaApiResponseDto;
        } else {
          // API가 HTTP 200을 반환했지만, 내부적으로 오류가 발생한 경우
          throw ServerException(
            message:
                'KMA API 오류: ${kmaApiResponseDto.response.header.resultMsg} (코드: ${kmaApiResponseDto.response.header.resultCode})',
            statusCode: 200, // HTTP 상태는 정상이지만 API 로직 실패
          );
        }
      } on FormatException catch (e) {
        // JSON 파싱 실패
        throw ServerException(
          message: 'KMA API 응답 파싱 실패 (잘못된 JSON): ${e.message}',
          statusCode: response.statusCode,
        );
      } catch (e) {
        // KmaApiResponseDto.fromJson 변환 실패 등 기타 오류
        throw ServerException(
          message: 'KMA API 응답 처리 중 오류 발생: ${e.toString()}',
          statusCode: response.statusCode,
        );
      }
    } else {
      // HTTP 상태 코드가 200이 아닌 경우 (4xx, 5xx 등)
      throw ServerException(
        message:
            'KMA 서버 오류: HTTP 상태 코드 ${response.statusCode} 수신. 응답: ${response.body.substring(0, (response.body.length > 200 ? 200 : response.body.length))}', // 응답 본문 일부만 포함
        statusCode: response.statusCode,
      );
    }
  }
}
