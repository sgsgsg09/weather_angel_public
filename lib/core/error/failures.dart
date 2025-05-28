// lib/core/error/failures.dart
// 또는 abstract_repositories 폴더 바로 위에 core/error 폴더를 만들거나,
// 이 파일 상단에 임시로 정의할 수 있습니다.

abstract class Failure {
  final String message;
  // 다른 공통 속성들 (예: statusCode) 추가 가능

  const Failure(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => message;
}

// 구체적인 Failure 타입들
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}

class LocationFailure extends Failure {
  const LocationFailure(String message) : super(message);
}

class CoordinateConversionFailure extends Failure {
  const CoordinateConversionFailure(String message) : super(message);
}

class NoDataFailure extends Failure {
  const NoDataFailure(String message) : super(message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(String message) : super(message);
}

// 기타 필요한 Failure 타입 추가 가능
class InvalidInputFailure extends Failure {
  const InvalidInputFailure(String message) : super(message);
}
