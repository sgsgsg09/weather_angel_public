import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_angel/core/error/exceptions.dart';
import 'package:weather_angel/core/providers.dart';
import 'package:weather_angel/core/theme/app_palette.dart';
import 'package:weather_angel/core/theme/app_theme.dart';
import 'package:weather_angel/features/location/domain/entities/position_entity.dart';

import 'package:weather_angel/core/error/failures.dart';
import 'package:weather_angel/features/weather/domain/entity/hourly_forecast.dart';
import 'package:weather_angel/features/weather/domain/entity/weather_forecast_data.dart';

// 날씨 UI 코드에 맞는 아이콘 매핑 (확장 메소드의 iconCode 사용)
IconData getWeatherIcon(String? uiConditionCode) {
  if (uiConditionCode == null) return Icons.texture_sharp; // 알 수 없음 아이콘
  switch (uiConditionCode.toUpperCase()) {
    case 'CLEAR':
      return Icons.wb_sunny_outlined;
    case 'MOSTLY_CLOUDY':
    case 'CLOUDY':
      return Icons.wb_cloudy_outlined;
    case 'RAIN':
    case 'SHOWER':
    case 'DRIZZLE':
      return Icons.water_drop_outlined; // 좀 더 비 다운 아이콘으로 교체 추천
    case 'RAIN_SNOW':
      return Icons.grain_outlined; // 비/눈 아이콘 (적절히 변경)
    case 'SNOW':
    case 'SNOW_FLURRY':
    case 'DRIZZLE_SNOW':
      return Icons.ac_unit_outlined;
    default:
      print("[getWeatherIcon] Unknown UI Condition Code: $uiConditionCode");
      return Icons.cloud_queue_outlined;
  }
}

class WeatherHomeScreen extends ConsumerStatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  ConsumerState<WeatherHomeScreen> createState() => _WeatherHomeScreenState();
}

class _WeatherHomeScreenState extends ConsumerState<WeatherHomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      print(
        "[WeatherHomeScreen] initState: Triggering initial location fetch.",
      );
      ref.read(locationNotifierProvider.notifier).fetchCurrentLocation();
    });
  }

  Future<void> _handleRefresh() async {
    print("[WeatherHomeScreen] Refresh triggered by user.");
    await ref.read(locationNotifierProvider.notifier).fetchCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    final weatherAsyncValue = ref.watch(currentWeatherForecastProvider);
    print("[WeatherHomeScreen] Building UI. WeatherState: $weatherAsyncValue");

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppPalette.gradientStart, AppPalette.gradientEnd],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: _handleRefresh,
            backgroundColor: AppPalette.primary.withOpacity(0.8),
            color: AppPalette.textPrimary,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Column(
                children: [
                  const _LocationDisplay(), // ConsumerWidget으로 변경했으므로 const 가능
                  weatherAsyncValue.when(
                    data:
                        (weatherData) => Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _CurrentWeatherSection(weatherData: weatherData),
                            const SizedBox(height: 24),
                            _HourlyForecastSection(
                              hourlyForecasts: weatherData.hourlyForecasts,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              weatherData.formattedIssuanceTime,
                              style: AppTheme.detailLabelTextStyle,
                            ), // 발표 시각 표시
                          ],
                        ),
                    loading:
                        () => const _LoadingIndicator(
                          message: '날씨 정보를 가져오는 중입니다...',
                        ),
                    error:
                        (error, stackTrace) => _ErrorDisplay(
                          error: error,
                          onRetry: _handleRefresh,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LocationDisplay extends ConsumerWidget {
  const _LocationDisplay();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationState = ref.watch(locationNotifierProvider);

    String displayText = '위치 정보 로딩 중...';
    if (locationState is AsyncData<PositionEntity>) {
      // TODO: geocoding 패키지 사용하여 실제 지역명으로 변환
      displayText = '강릉시, 대한민국'; // 예시 지역명
    } else if (locationState is AsyncError) {
      displayText = '위치를 가져올 수 없습니다.';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: GestureDetector(
        onTap:
            () =>
                ref
                    .read(locationNotifierProvider.notifier)
                    .fetchCurrentLocation(),
        child: Text(
          displayText,
          style: AppTheme.locationTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _CurrentWeatherSection extends StatelessWidget {
  final WeatherForecastData weatherData;
  const _CurrentWeatherSection({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      child: Column(
        children: [
          Icon(
            getWeatherIcon(weatherData.currentConditionCodeForIcon),
            size: 100,
            color: AppPalette.iconColor,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weatherData.currentTemperatureDisplay,
                style: AppTheme.currentTempTextStyle,
              ),
              if (weatherData.currentTemperatureDisplay != '--')
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text('°', style: AppTheme.degreeSymbolTextStyle),
                ),
            ],
          ),
          Text(
            '체감 ${weatherData.feelsLikeTemperatureDisplay}°',
            style: AppTheme.feelsLikeTextStyle,
          ),
          const SizedBox(height: 8),
          Text(
            weatherData.weatherSummaryToday,
            style: AppTheme.weatherConditionTextStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25),
          _AdditionalWeatherDetails(weatherData: weatherData),
        ],
      ),
    );
  }
}

class _AdditionalWeatherDetails extends StatelessWidget {
  final WeatherForecastData weatherData;
  const _AdditionalWeatherDetails({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _DetailItem(
          icon: Icons.air,
          label: '바람',
          value: weatherData.windSpeedDisplay,
        ),
        _DetailItem(
          icon: Icons.water_drop_outlined,
          label: '강수',
          value: weatherData.precipitationDisplay,
        ),
        _DetailItem(
          icon: Icons.opacity,
          label: '습도',
          value: weatherData.humidityDisplay,
        ),
      ],
    );
  }
}

class _DetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _DetailItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppPalette.iconSecondaryColor, size: 28),
        const SizedBox(height: 4),
        Text(label.toUpperCase(), style: AppTheme.detailLabelTextStyle),
        const SizedBox(height: 2),
        Text(value, style: AppTheme.detailValueTextStyle),
      ],
    );
  }
}

class _HourlyForecastSection extends StatelessWidget {
  final List<HourlyForecast> hourlyForecasts;
  const _HourlyForecastSection({required this.hourlyForecasts});

  @override
  Widget build(BuildContext context) {
    if (hourlyForecasts.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text("시간별 예보 정보가 없습니다.", style: AppTheme.feelsLikeTextStyle),
        ),
      );
    }
    final now = DateTime.now();

    return SizedBox(
      height: 130,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        itemCount: hourlyForecasts.length,
        itemBuilder: (context, index) {
          final forecast = hourlyForecasts[index];
          return Container(
            width: 70,
            margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color:
                  forecast.displayTime(now) == 'Now'
                      ? AppPalette.forecastNowBackground
                      : AppPalette.forecastItemBackground,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  forecast.displayTime(now),
                  style:
                      forecast.displayTime(now) == 'Now'
                          ? AppTheme.hourlyTimeNowTextStyle
                          : AppTheme.hourlyTimeTextStyle,
                ),
                Icon(
                  getWeatherIcon(forecast.iconCode),
                  color: AppPalette.iconColor,
                  size: 30,
                ),
                Text(
                  forecast.temperatureDisplay,
                  style: AppTheme.hourlyTempTextStyle,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  final String message;
  const _LoadingIndicator({this.message = '로딩 중...'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(color: AppPalette.textPrimary),
            const SizedBox(height: 16),
            Text(message, style: AppTheme.feelsLikeTextStyle),
          ],
        ),
      ),
    );
  }
}

class _ErrorDisplay extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;

  const _ErrorDisplay({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    String errorMessage = '오류가 발생했습니다.';
    if (error is Failure) {
      errorMessage = (error as Failure).message;
    } else if (error is GridXYStillLoadingException) {
      errorMessage = (error as GridXYStillLoadingException).message;
    } else {
      errorMessage = '날씨 정보를 가져올 수 없습니다.\n네트워크 연결을 확인하거나 잠시 후 다시 시도해주세요.';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: AppPalette.textSecondary,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              errorMessage,
              style: AppTheme.feelsLikeTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppPalette.primary.withOpacity(0.5),
                foregroundColor: AppPalette.textPrimary,
              ),
              child: const Text('다시 시도'),
            ),
          ],
        ),
      ),
    );
  }
}
