import 'package:intl/intl.dart';
import 'package:weather_angel/core/error/exceptions.dart'; // NoDataException, ServerException 포함
import 'package:weather_angel/features/weather/data/model/kma_weather_api_response_dto.dart';
import 'package:weather_angel/features/weather/domain/entity/daily_forecast.dart';
import 'package:weather_angel/features/weather/domain/entity/forecast_issuance_info.dart';
import 'package:weather_angel/features/weather/domain/entity/hourly_forecast.dart';
import 'package:weather_angel/features/weather/domain/entity/location_point.dart';
import 'package:weather_angel/features/weather/domain/entity/weather_forecast_data.dart';

class KmaWeatherMapper {
  /// KMA 아이템 리스트와 관련 메타데이터를 받아 WeatherForecastData 도메인 객체로 변환하는 핵심 로직.
  WeatherForecastData _mapItemsToDomain({
    required List<KmaItemDto> items,
    required int nx, // 요청 시 사용된 nx
    required int ny, // 요청 시 사용된 ny
    required String baseDate, // 예보 발표일 (API 응답 또는 캐시된 정보에서 가져옴)
    required String baseTime, // 예보 발표시각 (API 응답 또는 캐시된 정보에서 가져옴)
  }) {
    if (items.isEmpty) {
      // 이 경우는 보통 호출 전에 체크되지만, 방어적으로 추가
      throw NoDataException('매핑할 날씨 아이템이 없습니다.');
    }

    final location = LocationPoint(nx: nx, ny: ny);
    final issuanceInfo = ForecastIssuanceInfo(
      baseDate: baseDate,
      baseTime: baseTime,
    );

    final Map<String, Map<String, String>> hourlyDataMap = {};
    // 사용자가 제공한 KmaWeatherMapper의 dailySpecificItems 구조를 따릅니다.
    final Map<String, List<KmaItemDto>> dailySpecificItemsMap = {};

    for (var item in items) {
      if (item.category == 'TMN' || item.category == 'TMX') {
        dailySpecificItemsMap.putIfAbsent(item.fcstDate, () => []);
        dailySpecificItemsMap[item.fcstDate]!.add(item);
      } else {
        final dateTimeKey = '${item.fcstDate}${item.fcstTime}';
        hourlyDataMap.putIfAbsent(dateTimeKey, () => {});
        hourlyDataMap[dateTimeKey]![item.category] = item.fcstValue;
      }
    }

    final List<HourlyForecast> hourlyForecasts = [];
    hourlyDataMap.forEach((dateTimeKey, categories) {
      final fcstDateStr = dateTimeKey.substring(0, 8);
      final fcstTimeStr = dateTimeKey.substring(8, 12);
      DateTime forecastDateTime;
      try {
        forecastDateTime = DateFormat(
          'yyyyMMddHHmm',
        ).parseStrict(fcstDateStr + fcstTimeStr);
      } catch (e) {
        print("KmaWeatherMapper: DateTime 파싱 오류: $dateTimeKey, $e");
        return; // 다음 아이템으로
      }

      // 파싱 헬퍼 함수들
      double? tryParseDouble(String? s) =>
          (s == null || s.isEmpty) ? null : double.tryParse(s);
      int? tryParseInt(String? s) =>
          (s == null || s.isEmpty) ? null : int.tryParse(s);
      String? normalizePrecipitationValue(String? s, String unit) {
        if (s == null ||
            s.isEmpty ||
            s == "강수없음" ||
            s == "적설없음" ||
            s == "0" ||
            s == "0.0" ||
            s == "-")
          return null;
        if (double.tryParse(s) != null) return '$s$unit';
        return s;
      }

      double? parseWaveHeight(String? s) {
        final val = tryParseDouble(s);
        return (val == null || val == -999.0 || val < 0) ? null : val;
      }

      hourlyForecasts.add(
        HourlyForecast(
          forecastDateTime: forecastDateTime,
          temperatureCelsius: tryParseDouble(categories['TMP']),
          skyConditionCode: categories['SKY'],
          precipitationTypeCode: categories['PTY'],
          precipitationProbabilityPercent: tryParseInt(categories['POP']),
          precipitationValue: normalizePrecipitationValue(
            categories['PCP'],
            'mm',
          ),
          snowValue: normalizePrecipitationValue(categories['SNO'], 'cm'),
          humidityPercent: tryParseDouble(categories['REH']),
          windSpeedMps: tryParseDouble(categories['WSD']),
          windDirectionDeg: tryParseInt(categories['VEC']),
          windEastWestMps: tryParseDouble(categories['UUU']),
          windNorthSouthMps: tryParseDouble(categories['VVV']),
          waveHeightM: parseWaveHeight(categories['WAV']),
        ),
      );
    });
    hourlyForecasts.sort(
      (a, b) => a.forecastDateTime.compareTo(b.forecastDateTime),
    );

    final List<DailyForecast> dailyForecasts = [];
    dailySpecificItemsMap.forEach((dateKey, tmnTmxItems) {
      DateTime forecastDate;
      try {
        forecastDate = DateFormat('yyyyMMdd').parseStrict(dateKey);
      } catch (e) {
        print("KmaWeatherMapper: Date 파싱 오류: $dateKey, $e");
        return; // 다음 아이템으로
      }
      double? tmn, tmx;
      for (var item in tmnTmxItems) {
        if (item.category == 'TMN') tmn = double.tryParse(item.fcstValue);
        if (item.category == 'TMX') tmx = double.tryParse(item.fcstValue);
      }
      dailyForecasts.add(
        DailyForecast(
          date: forecastDate,
          minTemperatureCelsius: tmn,
          maxTemperatureCelsius: tmx,
          // TODO: 일별 POP, SKY 등은 hourlyForecasts에서 계산하여 채울 수 있습니다.
        ),
      );
    });
    dailyForecasts.sort((a, b) => a.date.compareTo(b.date));

    return WeatherForecastData(
      location: location,
      issuanceInfo: issuanceInfo,
      hourlyForecasts: hourlyForecasts,
      dailyForecasts: dailyForecasts,
      currentWeather: hourlyForecasts.isNotEmpty ? hourlyForecasts.first : null,
    );
  }

  /// KMA API 전체 응답 DTO를 도메인 객체로 변환합니다.
  /// API 응답 헤더의 resultCode가 "00"이 아니거나 body 또는 items가 비어있으면 예외를 발생시킵니다.
  WeatherForecastData mapResponseDtoToDomain(KmaApiResponseDto apiResponse) {
    if (apiResponse.response.header.resultCode != "00") {
      throw ServerException(
        // API 수준 오류는 ServerException으로
        message:
            'KMA API Error: ${apiResponse.response.header.resultMsg} (Code: ${apiResponse.response.header.resultCode})',
        statusCode: int.tryParse(apiResponse.response.header.resultCode) ?? -1,
      );
    }
    if (apiResponse.response.body == null ||
        apiResponse.response.body!.items.item.isEmpty) {
      throw NoDataException('API로부터 받은 날씨 아이템이 없습니다.');
    }

    final items = apiResponse.response.body!.items.item;
    final firstItem = items.first; // nx, ny, baseDate, baseTime은 첫 아이템 기준으로 사용

    return _mapItemsToDomain(
      items: items,
      nx: firstItem.nx, // API 응답에 포함된 nx, ny 사용
      ny: firstItem.ny,
      baseDate: firstItem.baseDate, // API 응답에 포함된 baseDate, baseTime 사용
      baseTime: firstItem.baseTime,
    );
  }

  /// 캐시된 `List<KmaItemDto>`와 요청 시 사용된 `nx`, `ny`를 받아 도메인 객체로 변환합니다.
  /// `baseDate`, `baseTime`은 아이템 리스트의 첫 번째 항목에서 가져와 사용합니다 (발표 시점 정보로 활용).
  WeatherForecastData mapCachedItemsToDomain({
    required List<KmaItemDto> cachedItems,
    required int requestNx, // 캐시 조회 시 사용된 nx
    required int requestNy, // 캐시 조회 시 사용된 ny
  }) {
    if (cachedItems.isEmpty) {
      throw NoDataException('캐시된 날씨 아이템이 없습니다.');
    }
    // 캐시된 아이템의 baseDate/baseTime을 예보 발표 정보로 사용
    final firstItem = cachedItems.first;
    return _mapItemsToDomain(
      items: cachedItems,
      nx: requestNx, // 캐시를 요청한 nx, ny
      ny: requestNy,
      baseDate: firstItem.baseDate, // 아이템 자체의 baseDate, baseTime 사용
      baseTime: firstItem.baseTime,
    );
  }
}
