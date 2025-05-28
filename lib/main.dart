import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Provider 정의 파일 import (실제 경로로 수정해주세요)
import 'package:weather_angel/core/providers.dart';
import 'package:weather_angel/features/weather/presentation/pages/weather_home_screen.dart';
// WeatherScreen import (실제 경로로 수정해주세요)

Future<void> main() async {
  // Flutter 엔진과 위젯 바인딩 초기화 (필수)
  WidgetsFlutterBinding.ensureInitialized();
  // --- 디버깅 코드 시작 ---
  final envFile = File('.env'); // 프로젝트 루트 기준 .env 파일 객체 생성
  print('확인 중인 .env 파일 절대 경로: ${envFile.absolute.path}');
  print('.env 파일 존재 여부: ${await envFile.exists()}');
  // --- 디버깅 코드 끝 ---

  // 1. .env 파일 로드 (API 키 등을 환경 변수에서 가져오기 위함)
  try {
    await dotenv.load(fileName: ".env");
    print(".env 파일 로드 성공"); // 로깅
  } catch (e) {
    print("오류: .env 파일을 로드할 수 없습니다. 파일이 존재하거나 형식이 올바른지 확인하세요.");
    print("에러 상세: $e");
    // .env 파일 로드 실패 시, apiKeyProvider에서 오류가 발생할 수 있습니다.
    // 필요에 따라 여기서 앱 실행을 중단하거나 기본값으로 진행하도록 처리할 수 있습니다.
  }

  // 2. SharedPreferences 인스턴스 비동기적으로 로드
  // 이 인스턴스는 ProviderScope의 overrides를 통해 sharedPreferencesProvider에 주입됩니다.
  final SharedPreferences sharedPreferencesInstance =
      await SharedPreferences.getInstance();
  print("SharedPreferences 인스턴스 로드 완료"); // 로깅

  // 3. ProviderScope로 앱 전체를 감싸서 Riverpod 상태 관리 활성화
  runApp(
    ProviderScope(
      child: const MyApp(), // 앱의 루트 위젯
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '날씨 천사', // 앱 제목
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const WeatherHomeScreen(), // 앱의 첫 화면으로 WeatherScreen 설정
      debugShowCheckedModeBanner: false, // 개발 중 디버그 배너 숨기기 (선택 사항)
    );
  }
}
