import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'location_point.dart';
import 'forecast_issuance_info.dart';
import 'hourly_forecast.dart';
import 'daily_forecast.dart';

part 'weather_forecast_data.freezed.dart';
part 'weather_forecast_data.g.dart';

// 최종적으로 UI에 전달될 통합 날씨 예보 데이터
@freezed
abstract class WeatherForecastData with _$WeatherForecastData {
  const factory WeatherForecastData({
    required LocationPoint location, // 예보 위치 (nx, ny)
    required ForecastIssuanceInfo issuanceInfo, // 예보 발표 정보
    required List<HourlyForecast> hourlyForecasts,
    required List<DailyForecast> dailyForecasts,
    // 현재 날씨는 hourlyForecasts의 첫 번째 항목 또는 별도 실황 API로 구성 가능
    HourlyForecast? currentWeather,
  }) = _WeatherForecastData;

  factory WeatherForecastData.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastDataFromJson(json);
}

//UI에서 쓰는 확장.

String _getDisplayWeatherConditionText(String? skyCode, String? ptyCode) {
  if (ptyCode != null && ptyCode != '0') {
    // 강수 형태가 우선
    switch (ptyCode) {
      case '1':
        return '비'; // 비
      case '2':
        return '비/눈'; // 비/눈
      case '3':
        return '눈'; // 눈
      case '4':
        return '소나기'; // 소나기
      case '5':
        return '빗방울';
      case '6':
        return '빗방울/눈날림';
      case '7':
        return '눈날림';
      default:
        break; // 알 수 없는 강수 형태
    }
  }
  if (skyCode != null) {
    // 하늘 상태
    switch (skyCode) {
      case '1':
        return '맑음'; // 맑음
      case '3':
        return '구름많음'; // 구름많음
      case '4':
        return '흐림'; // 흐림
      default:
        break; // 알 수 없는 하늘 상태
    }
  }
  return '정보 없음';
}

String _getDisplayWeatherConditionUiCode(String? skyCode, String? ptyCode) {
  // 아이콘 매핑을 위한 대표 코드 생성 (getWeatherIcon 함수에서 사용)
  if (ptyCode != null && ptyCode != '0') {
    switch (ptyCode) {
      case '1':
        return 'RAIN';
      case '2':
        return 'RAIN_SNOW';
      case '3':
        return 'SNOW';
      case '4':
        return 'SHOWER';
      case '5':
        return 'DRIZZLE';
      case '6':
        return 'DRIZZLE_SNOW';
      case '7':
        return 'SNOW_FLURRY';
      default:
        return 'UNKNOWN_PTY_$ptyCode';
    }
  }
  if (skyCode != null) {
    switch (skyCode) {
      case '1':
        return 'CLEAR';
      case '3':
        return 'MOSTLY_CLOUDY'; // 구름많음
      case '4':
        return 'CLOUDY'; // 흐림
      default:
        return 'UNKNOWN_SKY_$skyCode';
    }
  }
  return 'UNKNOWN';
}

// WeatherForecastData 엔티티에 대한 확장 메소드
extension WeatherForecastDataUIHelpers on WeatherForecastData {
  String get currentTemperatureDisplay {
    return currentWeather?.temperatureCelsius?.round().toString() ?? '--';
  }

  String get currentConditionTextDisplay {
    if (currentWeather == null) return '정보 없음';
    return _getDisplayWeatherConditionText(
      currentWeather!.skyConditionCode,
      currentWeather!.precipitationTypeCode,
    );
  }

  String? get currentConditionCodeForIcon {
    if (currentWeather == null) return null;
    return _getDisplayWeatherConditionUiCode(
      currentWeather!.skyConditionCode,
      currentWeather!.precipitationTypeCode,
    );
  }

  String get feelsLikeTemperatureDisplay {
    // 체감온도 계산 로직은 보통 기온, 습도, 풍속을 사용합니다.
    // 현재 HourlyForecast에 체감온도 필드가 없으므로, 단순 기온으로 대체하거나
    // KmaWeatherMapper에서 별도로 체감온도를 계산하여 WeatherForecastData에 추가 필드로 넣어주어야 합니다.
    // 여기서는 현재 온도를 그대로 사용합니다.
    return currentWeather?.temperatureCelsius?.round().toString() ??
        currentTemperatureDisplay;
  }

  // 오늘의 주요 날씨 요약 (예: "대체로 맑고 오후 한때 구름")
  // 이 정보는 KMA 단기예보 항목 여러 개를 종합하거나, 별도의 예보 API를 통해 얻어야 할 수 있습니다.
  // 현재 엔티티 구조만으로는 상세한 요약 생성 어려움. Mapper에서 생성하거나 단순화.
  String get weatherSummaryToday {
    return currentConditionTextDisplay; // 현재는 가장 최근 상태로 대체
  }

  String get windSpeedDisplay {
    // m/s를 km/h로 변환 (1 m/s = 3.6 km/h)
    final mps = currentWeather?.windSpeedMps;
    if (mps == null) return '-- km/h';
    return '${(mps * 3.6).round()} km/h';
  }

  String get precipitationDisplay {
    // HourlyForecast.precipitationValue는 문자열 ("강수없음", "1.0mm")
    // Mapper에서 숫자 부분만 추출하거나, 여기서 처리
    final pcp = currentWeather?.precipitationValue;
    if (pcp == null || pcp == "강수없음" || pcp == "0" || pcp == "0.0")
      return '0 mm';
    return pcp; // 예: "1.0mm"
  }

  String get humidityDisplay {
    return '${currentWeather?.humidityPercent?.round() ?? '--'} %';
  }

  String get formattedIssuanceTime {
    if (issuanceInfo.baseDate.isEmpty || issuanceInfo.baseTime.isEmpty) {
      return '발표 시간 정보 없음';
    }
    try {
      final year = int.parse(issuanceInfo.baseDate.substring(0, 4));
      final month = int.parse(issuanceInfo.baseDate.substring(4, 6));
      final day = int.parse(issuanceInfo.baseDate.substring(6, 8));
      final hour = int.parse(issuanceInfo.baseTime.substring(0, 2));
      final minute = int.parse(issuanceInfo.baseTime.substring(2, 4));

      final dateTime = DateTime(year, month, day, hour, minute);
      return DateFormat('M월 d일 HH:mm 발표', 'ko_KR').format(dateTime);
    } catch (e) {
      return '${issuanceInfo.baseDate} ${issuanceInfo.baseTime} 발표';
    }
  }
}

// HourlyForecast 엔티티에 대한 확장 메소드
extension HourlyForecastUIHelpers on HourlyForecast {
  String displayTime(DateTime currentTime) {
    if (forecastDateTime.year == currentTime.year &&
        forecastDateTime.month == currentTime.month &&
        forecastDateTime.day == currentTime.day &&
        forecastDateTime.hour == currentTime.hour) {
      return 'Now';
    }
    return DateFormat('ha', 'en_US').format(forecastDateTime); // 예: 5AM, 1PM
  }

  String get temperatureDisplay {
    return '${temperatureCelsius?.round() ?? '--'}°';
  }

  String? get iconCode {
    return _getDisplayWeatherConditionUiCode(
      skyConditionCode,
      precipitationTypeCode,
    );
  }

  String get conditionTextDisplay {
    return _getDisplayWeatherConditionText(
      skyConditionCode,
      precipitationTypeCode,
    );
  }
}
