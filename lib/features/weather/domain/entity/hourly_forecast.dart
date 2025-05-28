import 'package:freezed_annotation/freezed_annotation.dart';

part 'hourly_forecast.freezed.dart';
part 'hourly_forecast.g.dart';

@freezed
abstract class HourlyForecast with _$HourlyForecast {
  const factory HourlyForecast({
    required DateTime forecastDateTime, // 예보 시각 (fcstDate + fcstTime)
    double? temperatureCelsius, // TMP: 기온 (℃)
    String? skyConditionCode, // SKY: 하늘 상태 코드
    String? precipitationTypeCode, // PTY: 강수 형태 코드
    int? precipitationProbabilityPercent, // POP: 강수 확률 (%)
    // PCP, SNO는 "강수없음", "1.0mm" 등 문자열과 숫자 혼용 가능성이 있으므로 String으로 우선 처리
    // 또는 매퍼에서 파싱하여 double?로 변경 (예: "강수없음" -> 0.0 or null)
    String? precipitationValue, // PCP: 1시간 강수량 (문자열 값)
    String? snowValue, // SNO: 1시간 신적설 (문자열 값)

    double? humidityPercent, // REH: 습도 (%)
    double? windSpeedMps, // WSD: 풍속 (m/s)
    int? windDirectionDeg, // VEC: 풍향 (deg)
    double? windEastWestMps, // UUU: 동서바람성분 (m/s)
    double? windNorthSouthMps, // VVV: 남북바람성분 (m/s)
    double? waveHeightM, // WAV: 파고 (M), -999와 같은 특수값은 null 처리 필요
  }) = _HourlyForecast;

  factory HourlyForecast.fromJson(Map<String, dynamic> json) =>
      _$HourlyForecastFromJson(json);
}
