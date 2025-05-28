// TODO Implement this library.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart'; // geolocator 패키지 import
import 'package:weather_angel/core/error/exceptions.dart';
import 'package:weather_angel/features/location/data/models/position_model.dart';
import 'dart:async'; // TimeoutException을 위해

abstract class LocationRemoteDataSource {
  /// 현재 장치의 위치 정보를 가져옵니다.
  /// 성공 시 [PositionModel]을 반환합니다.
  /// 실패 시 [LocationServiceException], [LocationPermissionException], 또는 [DeviceLocationException]을 발생시킵니다.
  Future<PositionModel> getCurrentPositionFromDevice();
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  @override
  Future<PositionModel> getCurrentPositionFromDevice() async {
    bool serviceEnabled;
    LocationPermission permission;

    // 1. 위치 서비스 활성화 여부 확인
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // 위치 서비스가 비활성화된 경우, 사용자에게 활성화를 요청해야 함
      throw const LocationServiceException('위치 서비스가 비활성화되어 있습니다.');
    }

    // 2. 위치 권한 확인 및 요청
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // 권한이 거부된 경우
        throw const LocationPermissionException('위치 정보 접근 권한이 거부되었습니다.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // 권한이 영구적으로 거부된 경우, 앱 설정에서 직접 변경해야 함
      throw const LocationPermissionException(
        '위치 정보 접근 권한이 영구적으로 거부되었습니다. 앱 설정에서 권한을 허용해주세요.',
      );
    }

    // 3. 현재 위치 가져오기
    // 권한이 허용된 경우, 장치의 현재 위치에 접근합니다.
    try {
      // "정확한" 좌표를 위해 desiredAccuracy 설정
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      // Geolocator의 Position 객체를 우리의 PositionModel로 변환
      return PositionModel(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } on TimeoutException catch (_) {
      throw const DeviceLocationException('위치 정보를 가져오는 데 시간이 초과되었습니다.');
    } catch (e) {
      // Geolocator.getCurrentPosition()에서 발생할 수 있는 기타 예외 처리
      throw DeviceLocationException(
        '위치 정보를 가져오는 중 예상치 못한 오류가 발생했습니다: ${e.toString()}',
      );
    }
  }
}
