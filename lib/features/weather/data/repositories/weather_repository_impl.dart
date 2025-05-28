import 'package:dartz/dartz.dart';
import 'package:weather_angel/core/error/exceptions.dart';
import 'package:weather_angel/core/error/failures.dart';
import 'package:weather_angel/core/platform/network_info.dart';
import 'package:weather_angel/features/weather/data/datasources/weather_local_data_source.dart';
import 'package:weather_angel/features/weather/data/datasources/weather_remote_data_source.dart';
import 'package:weather_angel/features/weather/data/mapper/kma_weather_mapper.dart'; // 매퍼 import
import 'package:weather_angel/features/weather/data/model/kma_weather_api_response_dto.dart';
import 'package:weather_angel/features/weather/domain/entity/weather_forecast_data.dart';
// ... (기타 domain entity import) ...
import 'package:weather_angel/features/weather/domain/repositories/weather_repository.dart';

typedef _DataFetchingAndMappingOperation =
    Future<WeatherForecastData> Function();

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  final KmaWeatherMapper mapper;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
    required this.mapper,
  });

  Future<Either<Failure, WeatherForecastData>> _fetchDataAndMap(
    _DataFetchingAndMappingOperation operation,
  ) async {
    try {
      final weatherForecastData = await operation();
      return Right(weatherForecastData);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message ?? '서버 처리 중 오류가 발생했습니다.'));
    } on NoDataException catch (e) {
      return Left(NoDataFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message ?? '캐시 처리 중 오류가 발생했습니다.'));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message ?? '네트워크 오류가 발생했습니다.'));
    } catch (e) {
      print('WeatherRepositoryImpl (_fetchDataAndMap): 알 수 없는 오류 발생 - $e');
      return Left(UnknownFailure('예기치 않은 오류가 발생했습니다.'));
    }
  }

  @override
  Future<Either<Failure, WeatherForecastData>> getWeatherForecast({
    required int nx,
    required int ny,
    String? baseDate,
    String? baseTime,
  }) async {
    if (await networkInfo.isConnected) {
      // --- 온라인 경로 ---
      return _fetchDataAndMap(() async {
        final remoteApiResponse = await remoteDataSource
            .getWeatherForecastFromApi(
              nx: nx,
              ny: ny,
              baseDate: baseDate,
              baseTime: baseTime,
            );
        final weatherForecastData = mapper.mapResponseDtoToDomain(
          remoteApiResponse,
        );

        final itemsToCache = remoteApiResponse.response.body!.items.item;
        try {
          await localDataSource.cacheWeatherForecast(
            nx: nx,
            ny: ny,
            dataToCache: itemsToCache,
          );
        } on CacheException catch (e) {
          print('WeatherRepositoryImpl: 원격 데이터 캐싱 실패 - ${e.message}');
        }

        return weatherForecastData;
      });
    } else {
      // --- 오프라인 경로 ---
      List<KmaItemDto>? cachedItems;
      try {
        cachedItems = await localDataSource.getLastWeatherForecast(
          nx: nx,
          ny: ny,
        );
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message ?? '캐시된 데이터를 읽는 중 오류가 발생했습니다.'));
      } catch (e) {
        return Left(CacheFailure('캐시된 데이터 처리 중 예기치 않은 오류: ${e.toString()}'));
      }

      if (cachedItems == null || cachedItems.isEmpty) {
        return Left(CacheFailure('캐시된 데이터가 없습니다. 네트워크를 연결해주세요.'));
      }

      return _fetchDataAndMap(() async {
        return mapper.mapCachedItemsToDomain(
          cachedItems: cachedItems!, // 위에서 null 체크 완료
          requestNx: nx,
          requestNy: ny,
        );
      });
    }
  }
}
