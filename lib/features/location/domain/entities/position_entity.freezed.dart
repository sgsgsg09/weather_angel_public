// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'position_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PositionEntity {

 double get latitude; double get longitude;
/// Create a copy of PositionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PositionEntityCopyWith<PositionEntity> get copyWith => _$PositionEntityCopyWithImpl<PositionEntity>(this as PositionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PositionEntity&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'PositionEntity(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $PositionEntityCopyWith<$Res>  {
  factory $PositionEntityCopyWith(PositionEntity value, $Res Function(PositionEntity) _then) = _$PositionEntityCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude
});




}
/// @nodoc
class _$PositionEntityCopyWithImpl<$Res>
    implements $PositionEntityCopyWith<$Res> {
  _$PositionEntityCopyWithImpl(this._self, this._then);

  final PositionEntity _self;
  final $Res Function(PositionEntity) _then;

/// Create a copy of PositionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,}) {
  return _then(_self.copyWith(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc


class _PositionEntity implements PositionEntity {
  const _PositionEntity({required this.latitude, required this.longitude});
  

@override final  double latitude;
@override final  double longitude;

/// Create a copy of PositionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PositionEntityCopyWith<_PositionEntity> get copyWith => __$PositionEntityCopyWithImpl<_PositionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PositionEntity&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}


@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'PositionEntity(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$PositionEntityCopyWith<$Res> implements $PositionEntityCopyWith<$Res> {
  factory _$PositionEntityCopyWith(_PositionEntity value, $Res Function(_PositionEntity) _then) = __$PositionEntityCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude
});




}
/// @nodoc
class __$PositionEntityCopyWithImpl<$Res>
    implements _$PositionEntityCopyWith<$Res> {
  __$PositionEntityCopyWithImpl(this._self, this._then);

  final _PositionEntity _self;
  final $Res Function(_PositionEntity) _then;

/// Create a copy of PositionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,}) {
  return _then(_PositionEntity(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
