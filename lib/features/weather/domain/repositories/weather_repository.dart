import 'package:dartz/dartz.dart';
import 'package:weather_angel/core/error/failures.dart';
import 'package:weather_angel/features/weather/domain/entity/weather_forecast_data.dart';

abstract class WeatherRepository {
  /// 특정 위치의 종합적인 날씨 예보 데이터를 가져옵니다.
  ///
  /// 성공 시 [WeatherForecastData]를 포함하는 Right를 반환하고,
  /// 실패 시 [Failure]를 포함하는 Left를 반환합니다.
  Future<Either<Failure, WeatherForecastData>> getWeatherForecast({
    required int nx,
    required int ny,
    String? baseDate, // 필요에 따라 추가
    String? baseTime, // 필요에 따라 추가
  });
}
