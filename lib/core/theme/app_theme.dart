// lib/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'app_palette.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark, // 전반적인 테마 밝기 (어두운 배경이므로)
      primaryColor: AppPalette.primary,
      scaffoldBackgroundColor:
          AppPalette.gradientStart, // 기본 배경색 (Container 그라데이션이 우선됨)
      fontFamily: 'Roboto', // 기본 폰트 (pubspec.yaml에 폰트 추가 필요 시 설정)

      textTheme: TextTheme(
        // 예시: 화면 상단 위치 텍스트
        headlineSmall: TextStyle(
          color: AppPalette.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        // 예시: 현재 온도 (숫자 부분)
        displayLarge: TextStyle(
          color: AppPalette.textPrimary,
          fontSize: 90,
          fontWeight: FontWeight.w300,
        ),
        // 예시: 현재 온도 (도 ° 기호)
        displayMedium: TextStyle(
          color: AppPalette.textSecondary,
          fontSize: 40,
          fontWeight: FontWeight.w300,
        ),
        // 예시: "Feels like" 텍스트
        titleMedium: TextStyle(color: AppPalette.textSecondary, fontSize: 16),
        // 예시: 날씨 상태 (Heavy Rain Tonight)
        titleLarge: TextStyle(
          color: AppPalette.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        // 예시: 상세 정보 라벨 (WIND, RAIN)
        bodySmall: TextStyle(color: AppPalette.textSecondary, fontSize: 12),
        // 예시: 상세 정보 값 (9km/h)
        bodyMedium: TextStyle(
          color: AppPalette.textPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        // 예시: 시간별 예보 - 시간
        labelMedium: TextStyle(color: AppPalette.textPrimary, fontSize: 14),
        // 예시: 시간별 예보 - 온도
        labelLarge: TextStyle(
          color: AppPalette.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),

      iconTheme: IconThemeData(
        color: AppPalette.iconColor,
        size: 24, // 기본 아이콘 크기
      ),

      // 필요에 따라 다른 테마 속성 추가
      // appBarTheme: AppBarTheme( ... ),
      // buttonTheme: ButtonThemeData( ... ),
    );
  }

  // 특정 위젯에 직접 적용할 수 있는 커스텀 텍스트 스타일 (선택 사항)
  static const TextStyle locationTextStyle = TextStyle(
    color: AppPalette.textPrimary,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle currentTempTextStyle = TextStyle(
    color: AppPalette.textPrimary,
    fontSize: 90,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle degreeSymbolTextStyle = TextStyle(
    color: AppPalette.textSecondary,
    fontSize: 40,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle feelsLikeTextStyle = TextStyle(
    color: AppPalette.textSecondary,
    fontSize: 16,
  );

  static const TextStyle weatherConditionTextStyle = TextStyle(
    color: AppPalette.textPrimary,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle detailLabelTextStyle = TextStyle(
    color: AppPalette.textSecondary,
    fontSize: 12,
  );

  static const TextStyle detailValueTextStyle = TextStyle(
    color: AppPalette.textPrimary,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle hourlyTimeTextStyle = TextStyle(
    color: AppPalette.textPrimary,
    fontSize: 14,
  );
  static const TextStyle hourlyTimeNowTextStyle = TextStyle(
    color: AppPalette.textPrimary,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle hourlyTempTextStyle = TextStyle(
    color: AppPalette.textPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
