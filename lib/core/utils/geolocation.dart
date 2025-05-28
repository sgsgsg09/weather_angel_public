import 'package:dartz/dartz.dart'; // Either 타입을 위해 추가 (오류 처리)
import 'package:weather_angel/core/error/failures.dart';
import 'package:weather_angel/features/location/domain/entities/position_entity.dart'; // Failure 클래스 경로 (프로젝트에 맞게 수정)

/// 위치 정보 관련 로직을 추상화하는 인터페이스입니다.
///
/// 실제 구현체(예: Geolocator 패키지 사용)와 비즈니스 로직을 분리합니다.
abstract class Geolocation {
  /// 현재 위치 정보를 한 번 가져옵니다.
  ///
  /// 성공 시 [PositionEntity]를 포함하는 [Right]를 반환하고,
  /// 실패 시 [Failure]를 포함하는 [Left]를 반환합니다.
  Future<Either<Failure, PositionEntity>> getCurrentPosition();
}
