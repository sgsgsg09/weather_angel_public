import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_angel/core/error/failures.dart';
import 'package:weather_angel/core/usecase.dart';
import 'package:weather_angel/features/weather/domain/entity/location_point.dart';
import 'package:weather_angel/features/weather/domain/entity/weather_forecast_data.dart';
import 'package:weather_angel/features/weather/domain/repositories/weather_repository.dart';

class GetWeatherForecast implements UseCase<WeatherForecastData, Params> {
  late final WeatherRepository repository;

  GetWeatherForecast(this.repository);
  @override
  Future<Either<Failure, WeatherForecastData>> call(Params params) async {
    return await repository.getWeatherForecast(
      nx: params.locationPoint.nx,
      ny: params.locationPoint.ny,
      baseDate: params.baseDate, // Params에서 전달받은 baseDate 사용
      baseTime: params.baseTime, // Params에서 전달받은 baseTime 사용
    );
  }
}

class Params extends Equatable {
  final LocationPoint locationPoint;
  final String? baseDate; // 선택적 파라미터로 변경 (YYYYMMDD 형식)
  final String? baseTime; // 선택적 파라미터로 변경 (HHMM 형식)

  const Params({
    required this.locationPoint,
    this.baseDate, // 생성자에서도 선택적으로 받도록 수정
    this.baseTime, // 생성자에서도 선택적으로 받도록 수정
  });

  @override
  List<Object?> get props => [locationPoint, baseDate, baseTime];
}
