import 'package:equatable/equatable.dart'; // Equatable 패키지 import
// 아래 import 경로는 실제 프로젝트 구조에 맞게 수정해주세요.
import 'package:weather_angel/features/weather/domain/entity/weather_forecast_data.dart';
import 'package:weather_angel/core/error/failures.dart';

/// 날씨 UI 상태를 나타내는 sealed class 입니다.
sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => []; // Equatable을 위해 기본 props 정의
}

/// 초기 상태
class WeatherInitial extends WeatherState {
  const WeatherInitial();
  // props는 부모 클래스의 것을 사용하거나, 필요시 override
}

/// 데이터 로딩 중 상태
class WeatherLoading extends WeatherState {
  const WeatherLoading();
  // props는 부모 클래스의 것을 사용하거나, 필요시 override
}

/// 데이터 로드 완료 상태 (가져온 날씨 데이터를 포함)
class WeatherLoaded extends WeatherState {
  final WeatherForecastData weatherData;

  const WeatherLoaded({required this.weatherData});

  @override
  List<Object?> get props => [weatherData];
}

/// 오류 발생 상태 (발생한 Failure 정보를 포함)
class WeatherError extends WeatherState {
  final Failure failure;

  const WeatherError({required this.failure});

  @override
  List<Object?> get props => [failure];
}
