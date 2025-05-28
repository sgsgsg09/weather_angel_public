import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:weather_angel/core/error/failures.dart';
// Domain Entities
import 'package:weather_angel/features/weather/domain/entity/location_point.dart';
import 'package:weather_angel/features/weather/domain/entity/weather_forecast_data.dart';
import 'package:weather_angel/features/weather/domain/entity/forecast_issuance_info.dart'; // 테스트 데이터용
import 'package:weather_angel/features/weather/domain/entity/hourly_forecast.dart'; // 테스트 데이터용
import 'package:weather_angel/features/weather/domain/entity/daily_forecast.dart'; // 테스트 데이터용
// Repository
import 'package:weather_angel/features/weather/domain/repositories/weather_repository.dart';
// UseCase 및 Params (실제 파일 경로로 수정해주세요)
import 'package:weather_angel/features/weather/domain/usecases/get_weather_forecast.dart';

// MockWeatherRepository 클래스를 생성하기 위한 어노테이션
// 파일 이름에 맞춰서 '.mocks.dart'를 추가합니다.
@GenerateNiceMocks([MockSpec<WeatherRepository>()])
import 'get_weather_forecast_test.mocks.dart'; // 생성될 Mock 파일

void main() {
  // 테스트에 사용될 변수들 선언
  late GetWeatherForecast useCase;
  late MockWeatherRepository mockWeatherRepository;

  // 각 테스트 실행 전에 호출되는 설정 함수
  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    useCase = GetWeatherForecast(mockWeatherRepository);
  });

  // 테스트에 사용될 샘플 데이터
  const tNx = 60;
  const tNy = 127;
  const tLocationPoint = LocationPoint(nx: tNx, ny: tNy);
  const tBaseDate = "20250524";
  const tBaseTime = "1100";

  // Params 객체 (baseDate, baseTime 포함)
  const tParamsWithDate = Params(
    locationPoint: tLocationPoint,
    baseDate: tBaseDate,
    baseTime: tBaseTime,
  );

  // Params 객체 (baseDate, baseTime 미포함 - null)
  const tParamsWithoutDate = Params(locationPoint: tLocationPoint);

  // 성공 시 반환될 WeatherForecastData 샘플 객체
  final tWeatherForecastData = WeatherForecastData(
    location: tLocationPoint,
    issuanceInfo: const ForecastIssuanceInfo(
      baseDate: "20250524",
      baseTime: "0800",
    ),
    hourlyForecasts: [
      HourlyForecast(
        forecastDateTime: DateTime(2025, 5, 24, 9),
        temperatureCelsius: 16.0,
        skyConditionCode: "1",
      ),
    ],
    dailyForecasts: [
      DailyForecast(
        date: DateTime(2025, 5, 24),
        minTemperatureCelsius: 15.0,
        maxTemperatureCelsius: 25.0,
      ),
    ],
    currentWeather: HourlyForecast(
      // 현재 날씨는 보통 hourlyForecasts의 첫번째 항목 또는 별도 API
      forecastDateTime: DateTime(2025, 5, 24, 9),
      temperatureCelsius: 16.0,
      skyConditionCode: "1",
    ),
  );

  // 테스트 그룹 정의
  group('GetWeatherForecast UseCase', () {
    test(
      'should get weather forecast from the repository with specific baseDate and baseTime',
      () async {
        // Arrange: Repository가 성공적으로 WeatherForecastData를 반환하도록 설정
        when(
          mockWeatherRepository.getWeatherForecast(
            nx: tNx,
            ny: tNy,
            baseDate: tBaseDate,
            baseTime: tBaseTime,
          ),
        ).thenAnswer((_) async => Right(tWeatherForecastData));

        // Act: UseCase 실행
        final result = await useCase(tParamsWithDate);

        // Assert: 결과가 예상대로 Right(WeatherForecastData)인지 확인
        expect(result, Right(tWeatherForecastData));
        // Repository의 getWeatherForecast 메소드가 정확한 파라미터로 호출되었는지 검증
        verify(
          mockWeatherRepository.getWeatherForecast(
            nx: tNx,
            ny: tNy,
            baseDate: tBaseDate,
            baseTime: tBaseTime,
          ),
        );
        // Repository의 다른 메소드가 호출되지 않았는지 검증
        verifyNoMoreInteractions(mockWeatherRepository);
      },
    );

    test(
      'should get weather forecast from the repository with null baseDate and baseTime (latest forecast)',
      () async {
        // Arrange: Repository가 성공적으로 WeatherForecastData를 반환하도록 설정 (baseDate, baseTime은 null)
        when(
          mockWeatherRepository.getWeatherForecast(
            nx: tNx,
            ny: tNy,
            baseDate: null, // null로 전달되는지 확인
            baseTime: null, // null로 전달되는지 확인
          ),
        ).thenAnswer((_) async => Right(tWeatherForecastData));

        // Act: UseCase 실행 (baseDate, baseTime 없는 Params 사용)
        final result = await useCase(tParamsWithoutDate);

        // Assert: 결과가 예상대로 Right(WeatherForecastData)인지 확인
        expect(result, Right(tWeatherForecastData));
        // Repository의 getWeatherForecast 메소드가 null baseDate/Time으로 호출되었는지 검증
        verify(
          mockWeatherRepository.getWeatherForecast(
            nx: tNx,
            ny: tNy,
            baseDate: null,
            baseTime: null,
          ),
        );
        verifyNoMoreInteractions(mockWeatherRepository);
      },
    );

    test(
      'should return a ServerFailure when the repository call fails',
      () async {
        // Arrange: Repository가 ServerFailure를 반환하도록 설정
        const tServerFailure = ServerFailure("API 서버 오류");
        when(
          mockWeatherRepository.getWeatherForecast(
            nx: tNx,
            ny: tNy,
            baseDate: null, // 어떤 파라미터로 호출되든 Failure를 반환하도록 any() 사용 가능
            baseTime: null, // 또는 구체적인 값을 명시해도 됨
          ),
        ).thenAnswer((_) async => const Left(tServerFailure));
        // 위 when 조건에서 anyNamed를 사용하려면 다음과 같이 할 수 있습니다:
        // when(mockWeatherRepository.getWeatherForecast(
        //   nx: anyNamed('nx'),
        //   ny: anyNamed('ny'),
        //   baseDate: anyNamed('baseDate'),
        //   baseTime: anyNamed('baseTime'),
        // )).thenAnswer((_) async => Left(tServerFailure));

        // Act: UseCase 실행
        final result = await useCase(tParamsWithoutDate);

        // Assert: 결과가 예상대로 Left(ServerFailure)인지 확인
        expect(result, const Left(tServerFailure));
        // Repository의 getWeatherForecast 메소드가 호출되었는지 검증
        verify(
          mockWeatherRepository.getWeatherForecast(
            nx: tNx,
            ny: tNy,
            baseDate: null,
            baseTime: null,
          ),
        );
        verifyNoMoreInteractions(mockWeatherRepository);
      },
    );
  });
}
