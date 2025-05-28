import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_angel/core/error/exceptions.dart';
import 'package:weather_angel/features/weather/data/model/kma_weather_api_response_dto.dart';

const String CACHED_WEATHER_FORECAST_PREFIX = 'CACHED_WEATHER_FORECAST_';

abstract class WeatherLocalDataSource {
  Future<void> cacheWeatherForecast({
    required int nx,
    required int ny,
    required List<KmaItemDto> dataToCache,
  });

  Future<List<KmaItemDto>?> getLastWeatherForecast({
    required int nx,
    required int ny,
  });
}

class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final SharedPreferences sharedPreferences;

  WeatherLocalDataSourceImpl({required this.sharedPreferences});

  String _generateCacheKey(int nx, int ny) {
    return '$CACHED_WEATHER_FORECAST_PREFIX${nx}_$ny';
  }

  @override
  Future<void> cacheWeatherForecast({
    required int nx,
    required int ny,
    required List<KmaItemDto> dataToCache,
  }) async {
    final key = _generateCacheKey(nx, ny);
    try {
      // List<KmaItemDto>를 List<Map<String, dynamic>>으로 변환
      final List<Map<String, dynamic>> jsonList =
          dataToCache.map((item) => item.toJson()).toList();
      // List<Map<String, dynamic>>을 JSON 문자열로 인코딩
      final String jsonString = jsonEncode(jsonList);
      await sharedPreferences.setString(key, jsonString);
    } catch (e) {
      // 직렬화 또는 SharedPreferences 저장 오류
      throw CacheException(message: '데이터 캐싱 중 오류 발생: ${e.toString()}');
    }
  }

  @override
  Future<List<KmaItemDto>?> getLastWeatherForecast({
    required int nx,
    required int ny,
  }) async {
    final key = _generateCacheKey(nx, ny);
    final jsonString = sharedPreferences.getString(key);

    if (jsonString != null && jsonString.isNotEmpty) {
      try {
        // JSON 문자열을 List<dynamic> (실제로는 List<Map<String, dynamic>>)으로 디코딩
        final List<dynamic> decodedList = jsonDecode(jsonString);
        // List<dynamic>을 List<KmaItemDto>로 변환
        final List<KmaItemDto> kmaItemList =
            decodedList
                .map(
                  (itemJson) =>
                      KmaItemDto.fromJson(itemJson as Map<String, dynamic>),
                )
                .toList();
        return kmaItemList;
      } on FormatException catch (e) {
        // JSON 파싱 오류 (손상된 데이터)
        throw CacheException(
          message: '캐시된 데이터 파싱 중 오류 발생 (FormatException): ${e.toString()}',
        );
      } catch (e) {
        // 기타 역직렬화 오류
        throw CacheException(
          message: '캐시된 데이터 처리 중 알 수 없는 오류: ${e.toString()}',
        );
      }
    } else {
      return null; // 캐시된 데이터 없음
    }
  }
}
