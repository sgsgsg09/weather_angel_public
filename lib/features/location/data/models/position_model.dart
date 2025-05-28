import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_angel/features/location/domain/entities/position_entity.dart'; // PositionEntity 경로

part 'position_model.freezed.dart'; // freezed가 생성할 파일
part 'position_model.g.dart'; // json_serializable이 생성할 파일

@freezed
abstract class PositionModel with _$PositionModel {
  /// 데이터 계층에서 사용될 위치 정보 모델입니다.
  /// PositionEntity의 정보를 포함하며, JSON 직렬화/역직렬화 기능을 가집니다.
  ///
  /// [latitude] (double): 위도
  /// [longitude] (double): 경도
  const PositionModel._(); // private 생성자 추가 (메소드 정의를 위해)

  const factory PositionModel({
    required double latitude,
    required double longitude,
  }) = _PositionModel;

  /// JSON 맵으로부터 [PositionModel] 인스턴스를 생성합니다.
  factory PositionModel.fromJson(Map<String, dynamic> json) =>
      _$PositionModelFromJson(json);

  /// [PositionEntity]로부터 [PositionModel] 인스턴스를 생성합니다.
  /// API 요청 시 또는 다른 데이터 소스에서 엔티티를 모델로 변환할 때 유용합니다.
  factory PositionModel.fromEntity(PositionEntity entity) {
    return PositionModel(
      latitude: entity.latitude,
      longitude: entity.longitude,
    );
  }

  /// 현재 [PositionModel] 인스턴스를 [PositionEntity]로 변환합니다.
  /// 데이터 계층에서 도메인 계층으로 데이터를 전달할 때 사용됩니다.
  PositionEntity toEntity() {
    return PositionEntity(latitude: latitude, longitude: longitude);
  }
}
