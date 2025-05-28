import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:weather_angel/core/error/exceptions.dart';
import 'package:weather_angel/core/error/failures.dart';

// Core Layer
import 'package:weather_angel/core/platform/network_info.dart';
import 'package:weather_angel/core/utils/coordinate_converter.dart';

// Location Feature
import 'package:weather_angel/features/location/data/datasources/location_remote_data_source.dart';
import 'package:weather_angel/features/location/data/repositories/location_repository_impl.dart';
import 'package:weather_angel/features/location/domain/entities/position_entity.dart';
import 'package:weather_angel/features/location/domain/repositories/location_repository.dart';
import 'package:weather_angel/features/location/domain/usecases/get_location.dart';
import 'package:weather_angel/features/location/presentation/providers/location_provider.dart'; // LocationNotifier 정의 가정

// Weather Feature
import 'package:weather_angel/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:weather_angel/features/weather/data/datasources/weather_local_data_source.dart';
import 'package:weather_angel/features/weather/data/mapper/kma_weather_mapper.dart';
import 'package:weather_angel/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weather_angel/features/weather/domain/entity/weather_forecast_data.dart';
import 'package:weather_angel/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_angel/features/weather/domain/usecases/get_weather_forecast.dart';
import 'package:weather_angel/features/weather/presentation/state/weather_state.dart';

// ==========================================================================
// SECTION 1: 외부 라이브러리 인스턴스 및 설정값 프로바이더
// ==========================================================================

/// API 키를 제공하는 Provider (.env 파일에서 로드)
final apiKeyProvider = Provider<String>((ref) {
  final apiKey = dotenv.env['KMA_API_KEY'];
  if (apiKey == null || apiKey.isEmpty) {
    // 실제 앱에서는 로깅 또는 사용자에게 알림 등 더 견고한 오류 처리가 필요합니다.
    throw Exception('심각: KMA_API_KEY가 .env 파일에 정의되지 않았거나 비어있습니다.');
  }
  return apiKey;
});

/// SharedPreferences 인스턴스를 비동기적으로 제공하는 Provider
/// 앱 시작 시 main 함수에서 ProviderScope의 overrides를 사용하여 초기화할 필요가 없습니다.
final sharedPreferencesProvider = FutureProvider<SharedPreferences>((
  ref,
) async {
  return await SharedPreferences.getInstance();
});

/// http.Client 인스턴스를 제공하는 Provider
final httpClientProvider = Provider<http.Client>((ref) => http.Client());

/// Connectivity (from connectivity_plus) 인스턴스를 제공하는 Provider
final connectivityProvider = Provider<Connectivity>((ref) => Connectivity());

/// InternetConnection (from internet_connection_checker_plus) 인스턴스를 제공하는 Provider
final internetConnectionProvider = Provider<InternetConnection>(
  (ref) => InternetConnection(),
);

// ==========================================================================
// SECTION 2: 핵심 유틸리티 및 서비스 프로바이더
// ==========================================================================

/// NetworkInfo 구현체를 제공하는 Provider
final networkInfoProvider = Provider<NetworkInfo>((ref) {
  final connectivity = ref.watch(connectivityProvider);
  final internetConnection = ref.watch(internetConnectionProvider);
  return NetworkInfoImpl(
    connectivity: connectivity,
    internetConnection: internetConnection,
  );
});

/// CoordinateConverter 구현체를 제공하는 Provider (KMA LCC DFS 변환기)
final coordinateConverterProvider = Provider<CoordinateConverter>((ref) {
  return KmaLccDfsCoordinateConverterImpl();
});

// ==========================================================================
// SECTION 3: Location Feature 프로바이더
// ==========================================================================

// --- Location Data Layer ---
final locationRemoteDataSourceProvider = Provider<LocationRemoteDataSource>((
  ref,
) {
  return LocationRemoteDataSourceImpl();
});

// --- Location Domain Layer ---
final locationRepositoryProvider = Provider<LocationRepository>((ref) {
  final remoteDataSource = ref.watch(locationRemoteDataSourceProvider);
  return LocationRepositoryImpl(remoteDataSource: remoteDataSource);
});

final getLocationUseCaseProvider = Provider<GetLocation>((ref) {
  final repository = ref.watch(locationRepositoryProvider);
  return GetLocation(repository);
});

// ---- 위치 상태 및 Notifier ----
final locationNotifierProvider =
    StateNotifierProvider<LocationNotifier, AsyncValue<PositionEntity>>((ref) {
      final getLocationUseCase = ref.watch(getLocationUseCaseProvider);
      return LocationNotifier(getLocationUseCase);
    });
// ==========================================================================
// SECTION 4: Weather Feature 프로바이더
// ==========================================================================

// --- Weather Data Layer ---
final kmaWeatherMapperProvider = Provider<KmaWeatherMapper>(
  (ref) => KmaWeatherMapper(),
);

final weatherRemoteDataSourceProvider = Provider<WeatherRemoteDataSource>((
  ref,
) {
  final client = ref.watch(httpClientProvider);
  final apiKey = ref.watch(apiKeyProvider);
  return WeatherRemoteDataSourceImpl(client: client, apiKey: apiKey);
});

final weatherLocalDataSourceProvider = FutureProvider<WeatherLocalDataSource>((
  ref,
) async {
  // sharedPreferencesProvider의 Future를 await하여 SharedPreferences 인스턴스를 얻습니다.
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return WeatherLocalDataSourceImpl(sharedPreferences: prefs);
});

// --- Weather Domain Layer ---
final weatherRepositoryProvider = FutureProvider<WeatherRepository>((
  ref,
) async {
  final remoteDataSource = ref.watch(weatherRemoteDataSourceProvider);
  final localDataSource = await ref.watch(
    weatherLocalDataSourceProvider.future,
  );
  final networkInfo = ref.watch(networkInfoProvider);
  final mapper = ref.watch(kmaWeatherMapperProvider);

  return WeatherRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
    networkInfo: networkInfo,
    mapper: mapper,
  );
});

final getWeatherForecastUseCaseProvider = FutureProvider<GetWeatherForecast>((
  ref,
) async {
  final repository = await ref.watch(weatherRepositoryProvider.future);
  return GetWeatherForecast(repository);
});

// --- Weather Presentation Layer (Location 연동) ---

final currentGridXYProvider = Provider<AsyncValue<GridXY>>((ref) {
  final locationAsyncValue = ref.watch(locationNotifierProvider);

  return locationAsyncValue.when(
    data: (positionEntity) {
      final converter = ref.read(
        coordinateConverterProvider,
      ); // converter는 상태가 없으므로 read 가능
      final conversionResult = converter.convertToGrid(
        positionEntity.latitude,
        positionEntity.longitude,
      );
      return conversionResult.fold(
        (failure) =>
            AsyncValue.error(failure, StackTrace.current), // 변환 실패 시 에러
        (gridXY) => AsyncValue.data(gridXY), // 변환 성공 시 데이터
      );
    },
    loading: () => const AsyncValue.loading(), // 위치 정보 로딩 중
    error: (err, stack) => AsyncValue.error(err, stack), // 위치 정보 에러
  );
});

/// 현재 위치의 GridXY 좌표를 기반으로 날씨 예보 데이터를 제공하는 FutureProvider 입니다.
final currentWeatherForecastProvider = FutureProvider<WeatherForecastData>((
  ref,
) async {
  // 1. 현재 GridXY 좌표 상태를 구독합니다.
  final gridXYAsyncValue = ref.watch(currentGridXYProvider);

  return gridXYAsyncValue.when(
    data: (gridXY) async {
      // GridXY 데이터를 성공적으로 가져온 경우
      print(
        '[currentWeatherForecastProvider] GridXY data available: nx=${gridXY.x}, ny=${gridXY.y}. Fetching weather.',
      );

      // 2. WeatherRepository 인스턴스를 가져옵니다.
      final repository = await ref.watch(weatherRepositoryProvider.future);

      // 3. Repository의 getWeatherForecast 메소드를 호출합니다.
      //    baseDate와 baseTime을 전달하지 않으면 Repository 또는 DataSource 내부에서 결정합니다.
      final Either<Failure, WeatherForecastData> weatherResult =
          await repository.getWeatherForecast(
            nx: gridXY.x,
            ny: gridXY.y,
            // baseDate: null, // 명시적으로 null 또는 생략 가능
            // baseTime: null, // 명시적으로 null 또는 생략 가능
          );

      // 4. 결과를 처리합니다.
      return weatherResult.fold(
        (failure) {
          print(
            '[currentWeatherForecastProvider] Failed to fetch weather: $failure',
          );
          throw failure;
        },
        (weatherData) {
          print(
            '[currentWeatherForecastProvider] Successfully fetched weather data.',
          );
          return weatherData;
        },
      );
    },
    loading: () {
      print(
        '[currentWeatherForecastProvider] GridXY is loading. Weather forecast will wait.',
      );
      // GridXY가 로딩 중일 때 FutureProvider가 AsyncError 상태가 되도록 예외 발생
      throw const GridXYStillLoadingException('좌표 정보를 기다리는 중입니다...');
    },
    error: (error, stackTrace) {
      print(
        '[currentWeatherForecastProvider] Error obtaining GridXY: $error. Propagating as weather fetch error.',
      );
      if (error is Failure) {
        throw error;
      }
      throw UnknownFailure('격자 좌표 획득 중 오류 발생: ${error.toString()}');
    },
  );
});
