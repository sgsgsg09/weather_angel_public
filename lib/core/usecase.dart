import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart'; // NoParams를 위해 equatable 사용 (선택적)
import 'package:weather_angel/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  /// 이 메소드는 각 유스케이스의 핵심 로직을 수행합니다.
  ///
  /// 파라미터:
  ///   - [params]: 유스케이스 실행에 필요한 파라미터.
  ///
  /// 반환 값:
  ///   - `Future<Either<Failure, Type>>`: 비동기적으로 작업의 결과 (성공 시 `Type`, 실패 시 `Failure`)를 반환합니다.
  Future<Either<Failure, Type>> call(Params params);
}

/// 유스케이스가 파라미터를 받지 않을 때 사용할 클래스입니다.
/// Equatable을 상속하여 값 기반 비교를 쉽게 할 수 있습니다 (선택 사항).
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
