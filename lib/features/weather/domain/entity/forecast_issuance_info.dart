import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast_issuance_info.freezed.dart';
part 'forecast_issuance_info.g.dart';

// 예보 발표 정보
@freezed
abstract class ForecastIssuanceInfo with _$ForecastIssuanceInfo {
  const factory ForecastIssuanceInfo({
    required String baseDate, // 발표일자 (YYYYMMDD)
    required String baseTime, // 발표시각 (HHMM)
  }) = _ForecastIssuanceInfo;

  factory ForecastIssuanceInfo.fromJson(Map<String, dynamic> json) =>
      _$ForecastIssuanceInfoFromJson(json);
}
