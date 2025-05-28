import 'package:dartz/dartz.dart';
import 'package:weather_angel/core/error/exceptions.dart';
import 'package:weather_angel/core/error/failures.dart';
import 'package:weather_angel/features/location/data/datasources/location_remote_data_source.dart'; // DataSource import
import 'package:weather_angel/features/location/domain/entities/position_entity.dart';
import 'package:weather_angel/features/location/domain/repositories/location_repository.dart';
// PositionModel을 사용하므로 import 할 수 있지만, DataSource가 반환한 것을 바로 toEntity()로 변환하므로 필수 아님.

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remoteDataSource;
  // final NetworkInfo networkInfo; // 위치 정보는 네트워크 상태와 직접적 관련이 없을 수 있음 (GPS 등)

  LocationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, PositionEntity>> getLocation() async {
    try {
      // DataSource를 통해 PositionModel을 가져옵니다.
      final positionModel =
          await remoteDataSource.getCurrentPositionFromDevice();
      // PositionModel을 PositionEntity로 변환하여 반환합니다.
      return Right(positionModel.toEntity());
    } on LocationServiceException catch (e) {
      return Left(
        LocationFailure(e.message),
      ); // LocationFailure는 core/error/failures.dart에 정의 필요
    } on LocationPermissionException catch (e) {
      return Left(LocationFailure(e.message));
    } on DeviceLocationException catch (e) {
      return Left(LocationFailure(e.message));
    } catch (e) {
      // DataSource에서 처리되지 않은 기타 예외
      return Left(LocationFailure('위치 저장소에서 예상치 못한 오류 발생: ${e.toString()}'));
    }
  }
}
