// lib/core/error/exceptions.dart

import 'package:equatable/equatable.dart';

class ServerException implements Exception {
  final String? message;
  final int? statusCode;

  ServerException({this.message, this.statusCode});
}

class CacheException implements Exception {
  final String? message;
  CacheException({this.message});
}

class NetworkException implements Exception {
  final String? message;
  NetworkException({this.message});
}

// 필요한 다른 예외 추가 가능
class NoDataException implements Exception {
  final String message;
  NoDataException(this.message);

  @override
  String toString() => 'NoDataException: $message';
}

class LocationException implements Exception {
  final String message;
  LocationException({required this.message});

  @override
  String toString() => 'LocationException: $message';
}

class CoordinateConversionException implements Exception {
  final String message;
  CoordinateConversionException({required this.message});

  @override
  String toString() => 'CoordinateConversionException: $message';
}

class LocationServiceException extends Equatable implements Exception {
  final String message;
  const LocationServiceException(this.message);
  @override
  List<Object?> get props => [message];
}

class LocationPermissionException extends Equatable implements Exception {
  final String message;
  const LocationPermissionException(this.message);
  @override
  List<Object?> get props => [message];
}

class DeviceLocationException extends Equatable implements Exception {
  final String message;
  const DeviceLocationException(this.message);
  @override
  List<Object?> get props => [message];
}

// GridXY 로딩 중임을 나타내는 사용자 정의 예외 (선택적)
class GridXYStillLoadingException implements Exception {
  final String message;
  const GridXYStillLoadingException(this.message);
  @override
  String toString() => message;
}
