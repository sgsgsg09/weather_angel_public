import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_point.freezed.dart';
part 'location_point.g.dart';

// API에서 사용하는 격자 좌표 정보
@freezed
abstract class LocationPoint with _$LocationPoint {
  const factory LocationPoint({required int nx, required int ny}) =
      _LocationPoint;

  factory LocationPoint.fromJson(Map<String, dynamic> json) =>
      _$LocationPointFromJson(json);
}
