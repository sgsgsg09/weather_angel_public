// lib/features/location/domain/usecases/get_location.dart
import 'package:dartz/dartz.dart';
import 'package:weather_angel/core/error/failures.dart';
import 'package:weather_angel/core/usecase.dart';
import 'package:weather_angel/features/location/domain/entities/position_entity.dart';
import 'package:weather_angel/features/location/domain/repositories/location_repository.dart';

class GetLocation implements UseCase<PositionEntity, NoParams> {
  final LocationRepository locationRepository;

  GetLocation(this.locationRepository);

  @override
  Future<Either<Failure, PositionEntity>> call(NoParams params) {
    return locationRepository.getLocation();
  }
}
