import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Core
import 'package:weather_angel/core/error/exceptions.dart';
import 'package:weather_angel/core/error/failures.dart';
import 'package:weather_angel/core/platform/network_info.dart';

// Data Layer
import 'package:weather_angel/features/weather/data/datasources/weather_local_data_source.dart';
import 'package:weather_angel/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:weather_angel/features/weather/data/mapper/kma_weather_mapper.dart';
import 'package:weather_angel/features/weather/data/model/kma_weather_api_response_dto.dart';
import 'package:weather_angel/features/weather/data/repositories/weather_repository_impl.dart';

// Domain Layer
import 'package:weather_angel/features/weather/domain/entity/location_point.dart';
import 'package:weather_angel/features/weather/domain/entity/weather_forecast_data.dart';
import 'package:weather_angel/features/weather/domain/entity/forecast_issuance_info.dart';
import 'package:weather_angel/features/weather/domain/entity/hourly_forecast.dart';
import 'package:weather_angel/features/weather/domain/entity/daily_forecast.dart';

// 생성된 mock 파일 import
import 'weather_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<WeatherRemoteDataSource>(),
  MockSpec<WeatherLocalDataSource>(),
  MockSpec<NetworkInfo>(),
  MockSpec<KmaWeatherMapper>(),
])
void main() {
  late WeatherRepositoryImpl repository;
  late MockWeatherRemoteDataSource mockRemoteDataSource;
  late MockWeatherLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late MockKmaWeatherMapper mockMapper;

  setUp(() {
    mockRemoteDataSource = MockWeatherRemoteDataSource();
    mockLocalDataSource = MockWeatherLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    mockMapper = MockKmaWeatherMapper();
    repository = WeatherRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
      mapper: mockMapper,
    );
  });

  // --- Helper Functions for Online/Offline Test Groups ---
  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      body();
    });
  }

  // --- Test Data Definitions ---
  const tNx = 60;
  const tNy = 127;
  const tBaseDate = '20250524';
  const tBaseTime = '1100';

  final tKmaItemDto = KmaItemDto(
    baseDate: tBaseDate,
    baseTime: tBaseTime,
    category: 'TMP', // 예시 카테고리
    fcstDate: tBaseDate, // 예시 예보일자
    fcstTime: '1200', // 예시 예보시간
    fcstValue: '25', // 예시 예보값
    nx: tNx,
    ny: tNy,
  );
  final tKmaItemList = [tKmaItemDto];

  final tKmaApiResponseDtoSuccess = KmaApiResponseDto(
    response: KmaResponseDto(
      header: KmaHeaderDto(resultCode: '00', resultMsg: 'NORMAL_SERVICE'),
      body: KmaBodyDto(
        dataType: 'JSON',
        items: KmaItemsDto(item: tKmaItemList),
        pageNo: 1,
        numOfRows: 10, // 실제 API 응답에 맞게 조정
        totalCount: 1, // 실제 API 응답에 맞게 조정
      ),
    ),
  );

  final tKmaApiResponseDtoApiError = KmaApiResponseDto(
    response: KmaResponseDto(
      header: KmaHeaderDto(resultCode: '01', resultMsg: 'API_ERROR'),
      body: null,
    ),
  );

  final tWeatherForecastData = WeatherForecastData(
    location: LocationPoint(nx: tNx, ny: tNy),
    issuanceInfo: ForecastIssuanceInfo(
      baseDate: tBaseDate,
      baseTime: tBaseTime,
    ),
    hourlyForecasts: [
      HourlyForecast(
        forecastDateTime: DateTime(2025, 5, 24, 12),
        temperatureCelsius: 25.0,
      ),
    ], // Mapper 결과에 따라 구체화
    dailyForecasts: [], // Mapper 결과에 따라 구체화
    currentWeather: HourlyForecast(
      forecastDateTime: DateTime(2025, 5, 24, 12),
      temperatureCelsius: 25.0,
    ), // Mapper 결과에 따라 구체화
  );

  // --- Main Test Group for getWeatherForecast ---
  group('getWeatherForecast', () {
    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      // 결과값을 사용하지 않으므로, await 없이 호출하여 verify만 수행
      // mockRemoteDataSource 등이 성공적인 DTO를 반환하도록 stubbing 필요할 수 있음 (verify 이후 repository 로직 진행 방지)
      when(
        mockRemoteDataSource.getWeatherForecastFromApi(
          nx: tNx,
          ny: tNy,
          baseDate: tBaseDate,
          baseTime: tBaseTime,
        ),
      ).thenAnswer((_) async => tKmaApiResponseDtoSuccess);
      when(
        mockMapper.mapResponseDtoToDomain(any),
      ).thenReturn(tWeatherForecastData);

      repository.getWeatherForecast(
        nx: tNx,
        ny: tNy,
        baseDate: tBaseDate,
        baseTime: tBaseTime,
      );
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(
            mockRemoteDataSource.getWeatherForecastFromApi(
              nx: tNx,
              ny: tNy,
              baseDate: tBaseDate,
              baseTime: tBaseTime,
            ),
          ).thenAnswer((_) async => tKmaApiResponseDtoSuccess);
          when(
            mockMapper.mapResponseDtoToDomain(tKmaApiResponseDtoSuccess),
          ).thenReturn(tWeatherForecastData);
          // 로컬 캐싱은 성공적으로 이루어진다고 가정 (void 반환)
          when(
            mockLocalDataSource.cacheWeatherForecast(
              nx: tNx,
              ny: tNy,
              dataToCache: tKmaItemList,
            ),
          ).thenAnswer((_) async {});

          // act
          final result = await repository.getWeatherForecast(
            nx: tNx,
            ny: tNy,
            baseDate: tBaseDate,
            baseTime: tBaseTime,
          );

          // assert
          verify(
            mockRemoteDataSource.getWeatherForecastFromApi(
              nx: tNx,
              ny: tNy,
              baseDate: tBaseDate,
              baseTime: tBaseTime,
            ),
          );
          verify(mockMapper.mapResponseDtoToDomain(tKmaApiResponseDtoSuccess));
          expect(result, equals(Right(tWeatherForecastData)));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(
            mockRemoteDataSource.getWeatherForecastFromApi(
              nx: tNx,
              ny: tNy,
              baseDate: tBaseDate,
              baseTime: tBaseTime,
            ),
          ).thenAnswer((_) async => tKmaApiResponseDtoSuccess);
          when(
            mockMapper.mapResponseDtoToDomain(tKmaApiResponseDtoSuccess),
          ).thenReturn(tWeatherForecastData);
          when(
            mockLocalDataSource.cacheWeatherForecast(
              nx: tNx,
              ny: tNy,
              dataToCache: tKmaItemList,
            ),
          ).thenAnswer((_) async {});

          // act
          await repository.getWeatherForecast(
            nx: tNx,
            ny: tNy,
            baseDate: tBaseDate,
            baseTime: tBaseTime,
          );

          // assert
          // RemoteDataSource와 Mapper 호출도 필요하면 검증
          verify(
            mockRemoteDataSource.getWeatherForecastFromApi(
              nx: tNx,
              ny: tNy,
              baseDate: tBaseDate,
              baseTime: tBaseTime,
            ),
          );
          verify(mockMapper.mapResponseDtoToDomain(tKmaApiResponseDtoSuccess));
          // 핵심 검증: LocalDataSource의 cacheWeatherForecast 호출 확인
          verify(
            mockLocalDataSource.cacheWeatherForecast(
              nx: tNx,
              ny: tNy,
              dataToCache: tKmaItemList,
            ),
          );
        },
      );

      test(
        'should return ServerFailure when remote source returns an API error DTO',
        () async {
          // arrange
          when(
            mockRemoteDataSource.getWeatherForecastFromApi(
              nx: tNx,
              ny: tNy,
              baseDate: tBaseDate,
              baseTime: tBaseTime,
            ),
          ).thenAnswer((_) async => tKmaApiResponseDtoApiError);
          // API 에러 DTO를 Mapper가 ServerException으로 변환한다고 가정
          when(
            mockMapper.mapResponseDtoToDomain(tKmaApiResponseDtoApiError),
          ).thenThrow(
            ServerException(
              message:
                  'KMA API Error: ${tKmaApiResponseDtoApiError.response.header.resultMsg} (Code: ${tKmaApiResponseDtoApiError.response.header.resultCode})',
            ),
          );
          // act
          final result = await repository.getWeatherForecast(
            nx: tNx,
            ny: tNy,
            baseDate: tBaseDate,
            baseTime: tBaseTime,
          );
          // assert
          verify(
            mockRemoteDataSource.getWeatherForecastFromApi(
              nx: tNx,
              ny: tNy,
              baseDate: tBaseDate,
              baseTime: tBaseTime,
            ),
          );
          verify(mockMapper.mapResponseDtoToDomain(tKmaApiResponseDtoApiError));
          verifyZeroInteractions(mockLocalDataSource); // 데이터 캐싱 시도 안 함
          expect(result, isA<Left<Failure, WeatherForecastData>>());
          result.fold((failure) {
            expect(failure, isA<ServerFailure>());
            expect(
              failure.message,
              contains('KMA API Error: API_ERROR (Code: 01)'),
            );
          }, (_) => fail('Should not return data on API error DTO'));
        },
      );

      test(
        'should return ServerFailure when the call to remote data source throws a ServerException',
        () async {
          // arrange
          when(
            mockRemoteDataSource.getWeatherForecastFromApi(
              nx: tNx,
              ny: tNy,
              baseDate: tBaseDate,
              baseTime: tBaseTime,
            ),
          ).thenThrow(ServerException(message: 'Network Error'));
          // act
          final result = await repository.getWeatherForecast(
            nx: tNx,
            ny: tNy,
            baseDate: tBaseDate,
            baseTime: tBaseTime,
          );
          // assert
          verify(
            mockRemoteDataSource.getWeatherForecastFromApi(
              nx: tNx,
              ny: tNy,
              baseDate: tBaseDate,
              baseTime: tBaseTime,
            ),
          );
          verifyZeroInteractions(mockMapper); // Mapper 호출 안됨
          verifyZeroInteractions(mockLocalDataSource); // LocalDataSource 호출 안됨
          expect(result, equals(Left(ServerFailure('Network Error'))));
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return last locally cached data when the cached data is present',
        () async {
          // arrange
          when(
            mockLocalDataSource.getLastWeatherForecast(nx: tNx, ny: tNy),
          ).thenAnswer((_) async => tKmaItemList);
          when(
            mockMapper.mapCachedItemsToDomain(
              cachedItems: tKmaItemList,
              requestNx: tNx,
              requestNy: tNy,
            ),
          ).thenReturn(tWeatherForecastData);
          // act
          // 오프라인 시 baseDate, baseTime은 필수가 아닐 수 있음 (캐시 조회에 사용 안됨)
          final result = await repository.getWeatherForecast(nx: tNx, ny: tNy);
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastWeatherForecast(nx: tNx, ny: tNy));
          verify(
            mockMapper.mapCachedItemsToDomain(
              cachedItems: tKmaItemList,
              requestNx: tNx,
              requestNy: tNy,
            ),
          );
          expect(result, equals(Right(tWeatherForecastData)));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          // arrange
          // getLastWeatherForecast가 null을 반환하여 캐시 없음을 나타냄
          when(
            mockLocalDataSource.getLastWeatherForecast(nx: tNx, ny: tNy),
          ).thenAnswer((_) async => null);
          // 또는 CacheException을 발생시키는 경우
          // when(mockLocalDataSource.getLastWeatherForecast(nx: tNx, ny: tNy))
          //     .thenThrow(CacheException(message: 'No cached data'));

          // act
          final result = await repository.getWeatherForecast(nx: tNx, ny: tNy);
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastWeatherForecast(nx: tNx, ny: tNy));
          verifyZeroInteractions(mockMapper); // 데이터가 null이므로 Mapper 호출 안됨
          expect(result, isA<Left<Failure, WeatherForecastData>>());
          result.fold(
            (failure) {
              expect(failure, isA<CacheFailure>());
              // RepositoryImpl에서 CacheException을 CacheFailure로 변환할 때 메시지 확인
              expect(failure.message, '캐시된 데이터가 없습니다. 네트워크를 연결해주세요.');
            },
            (_) =>
                fail('Should not return data when cache is empty and offline'),
          );
        },
      );
    });
  });
}
