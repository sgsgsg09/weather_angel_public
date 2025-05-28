// lib/core/theme/app_palette.dart
import 'package:flutter/material.dart';

class AppPalette {
  // Background Gradient Colors
  static const Color gradientStart = Color(0xFF6B5BFF);
  static const Color gradientEnd = Color(0xFF897CFF);

  // Text Colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;
  static const Color textDisabled = Colors.white54; // 필요시 사용

  // Accent & Specific UI Element Colors
  static const Color iconColor = Colors.white;
  static const Color iconSecondaryColor = Colors.white70;

  static Color forecastNowBackground = Colors.white.withOpacity(0.3);
  static Color forecastItemBackground = Colors.white.withOpacity(0.15);

  // 일반적인 색상 (필요에 따라 추가)
  static const Color primary = Color(0xFF7A6AFF); // 그라데이션의 중간색 또는 대표색
  static const Color transparent = Colors.transparent;
}
