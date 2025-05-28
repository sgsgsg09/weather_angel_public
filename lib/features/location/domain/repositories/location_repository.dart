// lib/features/location/domain/repositories/location_repository.dart
import 'package:dartz/dartz.dart';
import 'package:weather_angel/core/error/failures.dart';
import 'package:weather_angel/features/weather/domain/entity/location_point.dart'; // 재사용
import 'package:weather_angel/features/location/domain/entities/position_entity.dart';

abstract class LocationRepository {
  Future<Either<Failure, PositionEntity>> getLocation();
}
