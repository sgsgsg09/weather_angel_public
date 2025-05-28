// lib/core/config/app_config.dart (예시)
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get kmaApiKey =>
      dotenv.env['KMA_API_KEY'] ?? 'YOUR_DEFAULT_FALLBACK_KEY';
}
