import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_forecast.freezed.dart';
part 'daily_forecast.g.dart';

@freezed
abstract class DailyForecast with _$DailyForecast {
  const factory DailyForecast({
    required DateTime date, // 예보 날짜
    double? minTemperatureCelsius, // TMN: 일 최저 기온 (℃)
    double? maxTemperatureCelsius, // TMX: 일 최고 기온 (℃)
    // 일별 POP, SKY 등은 시간별 데이터를 집계하여 생성하거나, 별도 API 항목이 있다면 사용
    int? precipitationProbabilityAvgPercent, // 일 평균 강수 확률 (계산 필요)
    String? overallSkyConditionCode, // 대표 하늘 상태 (계산 필요)
  }) = _DailyForecast;

  factory DailyForecast.fromJson(Map<String, dynamic> json) =>
      _$DailyForecastFromJson(json);
}
