// lib/core/platform/network_info.dart

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;
  final InternetConnection
  internetConnection; // 이전에는 InternetConnectionCheckerPlus 였을 수 있음

  NetworkInfoImpl({
    required this.connectivity,
    required this.internetConnection, // 이전 InternetConnectionCheckerPlus 이름과 일치하는지 확인
  });

  @override
  Future<bool> get isConnected async {
    final List<ConnectivityResult> connectivityResults =
        await connectivity.checkConnectivity();

    // 인터넷 연결이 가능한 유효한 연결 타입이 있는지 확인
    // (none, bluetooth, other는 일반적인 인터넷 연결로 간주하지 않음)
    bool hasInternetCapableConnection = connectivityResults.any(
      (result) =>
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile ||
          result == ConnectivityResult.ethernet ||
          result == ConnectivityResult.vpn,
    );

    if (!hasInternetCapableConnection) {
      // Wi-Fi, 모바일 데이터, 이더넷, VPN 연결이 감지되지 않으면 오프라인으로 간주
      return false;
    }

    // 잠재적으로 인터넷이 가능한 연결이 있다면, 실제 인터넷 접근성 확인
    return await internetConnection.hasInternetAccess;
  }
}
