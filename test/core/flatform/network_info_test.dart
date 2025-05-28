// test/core/platform/network_info_test.mocks.dart
// (이전 파일명과 동일하게 유지)
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
// InternetConnectionCheckerPlus의 실제 클래스명에 따라 import 및 Mock 대상 수정
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:weather_angel/core/platform/network_info.dart';

import 'network_info_test.mocks.dart';

// InternetConnection 대신 InternetConnectionChecker를 사용하고 있다면 아래와 같이 수정
// @GenerateMocks([Connectivity, InternetConnectionChecker])
@GenerateMocks([Connectivity, InternetConnection])
void main() {
  late NetworkInfoImpl networkInfo;
  late MockConnectivity mockConnectivity;
  late MockInternetConnection
  mockInternetConnection; // 또는 MockInternetConnectionChecker

  setUp(() {
    mockConnectivity = MockConnectivity();
    mockInternetConnection =
        MockInternetConnection(); // 또는 MockInternetConnectionChecker()
    networkInfo = NetworkInfoImpl(
      connectivity: mockConnectivity,
      internetConnection:
          mockInternetConnection, // 또는 internetConnectionChecker: mockInternetConnection
    );
  });

  group('isConnected', () {
    test(
      'should return false when connectivity results list only contains none or is empty effectively',
      () async {
        // arrange
        // checkConnectivity()가 List<ConnectivityResult>를 반환하도록 수정
        when(
          mockConnectivity.checkConnectivity(),
        ).thenAnswer((_) async => [ConnectivityResult.none]); // 리스트로 반환

        // act
        final result = await networkInfo.isConnected;

        // assert
        expect(result, false);
        verify(mockConnectivity.checkConnectivity()).called(1);
        // 수정된 NetworkInfoImpl 로직에 따라 이 부분은 호출될 수도, 안 될 수도 있음.
        // 현재 로직에서는 hasInternetCapableConnection = false 이므로 호출 안됨.
        verifyNever(mockInternetConnection.hasInternetAccess);
      },
    );

    test(
      'should return true when connectivity exists (e.g., wifi) and internet is available',
      () async {
        // arrange
        when(
          mockConnectivity.checkConnectivity(),
        ).thenAnswer((_) async => [ConnectivityResult.wifi]); // 리스트로 반환
        when(
          mockInternetConnection.hasInternetAccess,
        ).thenAnswer((_) async => true);

        // act
        final result = await networkInfo.isConnected;

        // assert
        expect(result, true);
        verify(mockConnectivity.checkConnectivity()).called(1);
        verify(mockInternetConnection.hasInternetAccess).called(1);
      },
    );

    test(
      'should return false when connectivity exists (e.g., mobile) but no internet access',
      () async {
        // arrange
        when(
          mockConnectivity.checkConnectivity(),
        ).thenAnswer((_) async => [ConnectivityResult.mobile]); // 리스트로 반환
        when(
          mockInternetConnection.hasInternetAccess,
        ).thenAnswer((_) async => false);

        // act
        final result = await networkInfo.isConnected;

        // assert
        expect(result, false);
        verify(mockConnectivity.checkConnectivity()).called(1);
        verify(mockInternetConnection.hasInternetAccess).called(1);
      },
    );

    test(
      'should return false when connectivity results list is empty (if API can return this)',
      () async {
        // arrange
        when(
          mockConnectivity.checkConnectivity(),
        ).thenAnswer((_) async => []); // 빈 리스트 반환 (실제 API가 이렇게 반환하는지 확인 필요)
        // 일반적으로는 [ConnectivityResult.none]을 반환함

        // act
        final result = await networkInfo.isConnected;

        // assert
        expect(result, false);
        verify(mockConnectivity.checkConnectivity()).called(1);
        verifyNever(mockInternetConnection.hasInternetAccess);
      },
    );

    test('should return false when connectivity is only bluetooth', () async {
      // arrange
      when(
        mockConnectivity.checkConnectivity(),
      ).thenAnswer((_) async => [ConnectivityResult.bluetooth]);

      // act
      final result = await networkInfo.isConnected;

      // assert
      // 현재 NetworkInfoImpl 로직 상 bluetooth는 인터넷 가능 연결로 보지 않으므로 false 예상
      expect(result, false);
      verify(mockConnectivity.checkConnectivity()).called(1);
      verifyNever(mockInternetConnection.hasInternetAccess);
    });
  });
}
