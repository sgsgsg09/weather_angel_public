import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:weather_angel/core/error/exceptions.dart';
// KmaItemDto 및 WeatherLocalDataSourceImpl, CACHED_WEATHER_FORECAST_PREFIX 경로 수정 필요
import 'package:weather_angel/features/weather/data/model/kma_weather_api_response_dto.dart';

// WeatherLocalDataSource 인터페이스 경로
import 'package:weather_angel/features/weather/data/datasources/weather_local_data_source.dart';

// SharedPreferences Mock 생성
@GenerateNiceMocks([MockSpec<SharedPreferences>()])
import 'weather_local_data_source_test.mocks.dart';

void main() {
  late WeatherLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = WeatherLocalDataSourceImpl(
      sharedPreferences: mockSharedPreferences,
    );
  });

  const tNx = 60;
  const tNy = 127;
  final String tCacheKey = '$CACHED_WEATHER_FORECAST_PREFIX${tNx}_$tNy';

  // KmaItemDto 샘플 데이터 생성 (테스트의 일관성을 위해 간단하게 만듭니다)
  final tKmaItemDto1 = KmaItemDto(
    baseDate: '20250524',
    baseTime: '1100',
    category: 'TMP',
    fcstDate: '20250524',
    fcstTime: '1200',
    fcstValue: '25',
    nx: tNx,
    ny: tNy,
  );
  final tKmaItemDto2 = KmaItemDto(
    baseDate: '20250524',
    baseTime: '1100',
    category: 'POP',
    fcstDate: '20250524',
    fcstTime: '1200',
    fcstValue: '10',
    nx: tNx,
    ny: tNy,
  );
  final List<KmaItemDto> tKmaItemList = [tKmaItemDto1, tKmaItemDto2];

  // tKmaItemList를 직렬화한 JSON 문자열
  final tKmaItemListJsonString = jsonEncode(
    tKmaItemList.map((item) => item.toJson()).toList(),
  );

  group('cacheWeatherForecast', () {
    test(
      'should call SharedPreferences.setString with the correct key and serialized data',
      () async {
        // Arrange
        // setString이 Future<bool>을 반환하므로, true를 반환하도록 설정
        when(
          mockSharedPreferences.setString(any, any),
        ).thenAnswer((_) async => true);

        // Act
        await dataSource.cacheWeatherForecast(
          nx: tNx,
          ny: tNy,
          dataToCache: tKmaItemList,
        );

        // Assert
        verify(
          mockSharedPreferences.setString(tCacheKey, tKmaItemListJsonString),
        );
      },
    );

    test(
      'should throw a CacheException when SharedPreferences.setString fails',
      () async {
        // Arrange
        when(
          mockSharedPreferences.setString(any, any),
        ).thenThrow(Exception('SharedPreferences error')); // 일반 Exception 발생 가정

        // Act
        final call = dataSource.cacheWeatherForecast;

        // Assert
        // CacheException이 발생하는지 확인
        expect(
          () => call(nx: tNx, ny: tNy, dataToCache: tKmaItemList),
          throwsA(isA<CacheException>()),
        );
      },
    );
  });

  group('getLastWeatherForecast', () {
    test(
      'should return List<KmaItemDto> from SharedPreferences when there is valid cached data',
      () async {
        // Arrange
        when(
          mockSharedPreferences.getString(tCacheKey),
        ).thenReturn(tKmaItemListJsonString);

        // Act
        final result = await dataSource.getLastWeatherForecast(
          nx: tNx,
          ny: tNy,
        );

        // Assert
        expect(result, equals(tKmaItemList));
        verify(mockSharedPreferences.getString(tCacheKey));
      },
    );

    test(
      'should return null when there is no cached data for the key',
      () async {
        // Arrange
        when(mockSharedPreferences.getString(tCacheKey)).thenReturn(null);

        // Act
        final result = await dataSource.getLastWeatherForecast(
          nx: tNx,
          ny: tNy,
        );

        // Assert
        expect(result, isNull);
        verify(mockSharedPreferences.getString(tCacheKey));
      },
    );

    test('should return null when cached data is an empty string', () async {
      // Arrange
      when(mockSharedPreferences.getString(tCacheKey)).thenReturn('');

      // Act
      final result = await dataSource.getLastWeatherForecast(nx: tNx, ny: tNy);

      // Assert
      expect(result, isNull);
      verify(mockSharedPreferences.getString(tCacheKey));
    });

    test(
      'should throw a CacheException when cached data is corrupted (invalid JSON)',
      () async {
        // Arrange
        when(
          mockSharedPreferences.getString(tCacheKey),
        ).thenReturn('this is not a valid json string');

        // Act
        final call = dataSource.getLastWeatherForecast;

        // Assert
        expect(() => call(nx: tNx, ny: tNy), throwsA(isA<CacheException>()));
        verify(mockSharedPreferences.getString(tCacheKey));
      },
    );

    test(
      'should throw a CacheException when cached data is valid JSON list but not list of KmaItemDto compatible maps',
      () async {
        // Arrange
        // KmaItemDto.fromJson이 실패할 만한 JSON (예: 필드가 다르거나 타입이 다름)
        final corruptedItemListJsonString = jsonEncode([
          {
            'category': 'TMP',
            'fcstValue': '25',
            'invalidField': true,
          }, // KmaItemDto.fromJson 실패 유도
          {'category': 'POP', 'fcstValue': '10'},
        ]);
        when(
          mockSharedPreferences.getString(tCacheKey),
        ).thenReturn(corruptedItemListJsonString);

        // Act
        final call = dataSource.getLastWeatherForecast;

        // Assert
        // KmaItemDto.fromJson 내부에서 에러가 발생하거나, 그 전에 타입 캐스팅에서 에러가 날 수 있음
        // 이는 CacheException으로 변환되어야 함
        expect(() => call(nx: tNx, ny: tNy), throwsA(isA<CacheException>()));
        verify(mockSharedPreferences.getString(tCacheKey));
      },
    );
  });
}
