import 'package:freezed_annotation/freezed_annotation.dart';

part 'position_entity.freezed.dart'; // freezed가 생성할 파일
// 만약 JSON 직렬화/역직렬화가 필요하다면 .g.dart 파일도 추가
// part 'position_entity.g.dart';

@freezed
abstract class PositionEntity with _$PositionEntity {
  /// 애플리케이션 도메인 계층에서 사용될 위치 정보 엔티티입니다.
  ///
  /// [latitude] (double): 위도
  /// [longitude] (double): 경도
  const factory PositionEntity({
    required double latitude,
    required double longitude,
  }) = _PositionEntity;

  // 만약 JSON 직렬화/역직렬화가 필요하다면 fromJson 팩토리 메소드 추가
  // factory PositionEntity.fromJson(Map<String, dynamic> json) => _$PositionEntityFromJson(json);
}
