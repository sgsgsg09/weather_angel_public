// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kma_weather_api_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KmaApiResponseDto {

 KmaResponseDto get response;
/// Create a copy of KmaApiResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KmaApiResponseDtoCopyWith<KmaApiResponseDto> get copyWith => _$KmaApiResponseDtoCopyWithImpl<KmaApiResponseDto>(this as KmaApiResponseDto, _$identity);

  /// Serializes this KmaApiResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KmaApiResponseDto&&(identical(other.response, response) || other.response == response));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'KmaApiResponseDto(response: $response)';
}


}

/// @nodoc
abstract mixin class $KmaApiResponseDtoCopyWith<$Res>  {
  factory $KmaApiResponseDtoCopyWith(KmaApiResponseDto value, $Res Function(KmaApiResponseDto) _then) = _$KmaApiResponseDtoCopyWithImpl;
@useResult
$Res call({
 KmaResponseDto response
});


$KmaResponseDtoCopyWith<$Res> get response;

}
/// @nodoc
class _$KmaApiResponseDtoCopyWithImpl<$Res>
    implements $KmaApiResponseDtoCopyWith<$Res> {
  _$KmaApiResponseDtoCopyWithImpl(this._self, this._then);

  final KmaApiResponseDto _self;
  final $Res Function(KmaApiResponseDto) _then;

/// Create a copy of KmaApiResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? response = null,}) {
  return _then(_self.copyWith(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as KmaResponseDto,
  ));
}
/// Create a copy of KmaApiResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KmaResponseDtoCopyWith<$Res> get response {
  
  return $KmaResponseDtoCopyWith<$Res>(_self.response, (value) {
    return _then(_self.copyWith(response: value));
  });
}
}


/// @nodoc

@JsonSerializable(explicitToJson: true)
class _KmaApiResponseDto implements KmaApiResponseDto {
  const _KmaApiResponseDto({required this.response});
  factory _KmaApiResponseDto.fromJson(Map<String, dynamic> json) => _$KmaApiResponseDtoFromJson(json);

@override final  KmaResponseDto response;

/// Create a copy of KmaApiResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KmaApiResponseDtoCopyWith<_KmaApiResponseDto> get copyWith => __$KmaApiResponseDtoCopyWithImpl<_KmaApiResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KmaApiResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KmaApiResponseDto&&(identical(other.response, response) || other.response == response));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'KmaApiResponseDto(response: $response)';
}


}

/// @nodoc
abstract mixin class _$KmaApiResponseDtoCopyWith<$Res> implements $KmaApiResponseDtoCopyWith<$Res> {
  factory _$KmaApiResponseDtoCopyWith(_KmaApiResponseDto value, $Res Function(_KmaApiResponseDto) _then) = __$KmaApiResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 KmaResponseDto response
});


@override $KmaResponseDtoCopyWith<$Res> get response;

}
/// @nodoc
class __$KmaApiResponseDtoCopyWithImpl<$Res>
    implements _$KmaApiResponseDtoCopyWith<$Res> {
  __$KmaApiResponseDtoCopyWithImpl(this._self, this._then);

  final _KmaApiResponseDto _self;
  final $Res Function(_KmaApiResponseDto) _then;

/// Create a copy of KmaApiResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(_KmaApiResponseDto(
response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as KmaResponseDto,
  ));
}

/// Create a copy of KmaApiResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KmaResponseDtoCopyWith<$Res> get response {
  
  return $KmaResponseDtoCopyWith<$Res>(_self.response, (value) {
    return _then(_self.copyWith(response: value));
  });
}
}


/// @nodoc
mixin _$KmaResponseDto {

 KmaHeaderDto get header; KmaBodyDto? get body;
/// Create a copy of KmaResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KmaResponseDtoCopyWith<KmaResponseDto> get copyWith => _$KmaResponseDtoCopyWithImpl<KmaResponseDto>(this as KmaResponseDto, _$identity);

  /// Serializes this KmaResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KmaResponseDto&&(identical(other.header, header) || other.header == header)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,header,body);

@override
String toString() {
  return 'KmaResponseDto(header: $header, body: $body)';
}


}

/// @nodoc
abstract mixin class $KmaResponseDtoCopyWith<$Res>  {
  factory $KmaResponseDtoCopyWith(KmaResponseDto value, $Res Function(KmaResponseDto) _then) = _$KmaResponseDtoCopyWithImpl;
@useResult
$Res call({
 KmaHeaderDto header, KmaBodyDto? body
});


$KmaHeaderDtoCopyWith<$Res> get header;$KmaBodyDtoCopyWith<$Res>? get body;

}
/// @nodoc
class _$KmaResponseDtoCopyWithImpl<$Res>
    implements $KmaResponseDtoCopyWith<$Res> {
  _$KmaResponseDtoCopyWithImpl(this._self, this._then);

  final KmaResponseDto _self;
  final $Res Function(KmaResponseDto) _then;

/// Create a copy of KmaResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? header = null,Object? body = freezed,}) {
  return _then(_self.copyWith(
header: null == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as KmaHeaderDto,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as KmaBodyDto?,
  ));
}
/// Create a copy of KmaResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KmaHeaderDtoCopyWith<$Res> get header {
  
  return $KmaHeaderDtoCopyWith<$Res>(_self.header, (value) {
    return _then(_self.copyWith(header: value));
  });
}/// Create a copy of KmaResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KmaBodyDtoCopyWith<$Res>? get body {
    if (_self.body == null) {
    return null;
  }

  return $KmaBodyDtoCopyWith<$Res>(_self.body!, (value) {
    return _then(_self.copyWith(body: value));
  });
}
}


/// @nodoc

@JsonSerializable(explicitToJson: true)
class _KmaResponseDto implements KmaResponseDto {
  const _KmaResponseDto({required this.header, this.body});
  factory _KmaResponseDto.fromJson(Map<String, dynamic> json) => _$KmaResponseDtoFromJson(json);

@override final  KmaHeaderDto header;
@override final  KmaBodyDto? body;

/// Create a copy of KmaResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KmaResponseDtoCopyWith<_KmaResponseDto> get copyWith => __$KmaResponseDtoCopyWithImpl<_KmaResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KmaResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KmaResponseDto&&(identical(other.header, header) || other.header == header)&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,header,body);

@override
String toString() {
  return 'KmaResponseDto(header: $header, body: $body)';
}


}

/// @nodoc
abstract mixin class _$KmaResponseDtoCopyWith<$Res> implements $KmaResponseDtoCopyWith<$Res> {
  factory _$KmaResponseDtoCopyWith(_KmaResponseDto value, $Res Function(_KmaResponseDto) _then) = __$KmaResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 KmaHeaderDto header, KmaBodyDto? body
});


@override $KmaHeaderDtoCopyWith<$Res> get header;@override $KmaBodyDtoCopyWith<$Res>? get body;

}
/// @nodoc
class __$KmaResponseDtoCopyWithImpl<$Res>
    implements _$KmaResponseDtoCopyWith<$Res> {
  __$KmaResponseDtoCopyWithImpl(this._self, this._then);

  final _KmaResponseDto _self;
  final $Res Function(_KmaResponseDto) _then;

/// Create a copy of KmaResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? header = null,Object? body = freezed,}) {
  return _then(_KmaResponseDto(
header: null == header ? _self.header : header // ignore: cast_nullable_to_non_nullable
as KmaHeaderDto,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as KmaBodyDto?,
  ));
}

/// Create a copy of KmaResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KmaHeaderDtoCopyWith<$Res> get header {
  
  return $KmaHeaderDtoCopyWith<$Res>(_self.header, (value) {
    return _then(_self.copyWith(header: value));
  });
}/// Create a copy of KmaResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KmaBodyDtoCopyWith<$Res>? get body {
    if (_self.body == null) {
    return null;
  }

  return $KmaBodyDtoCopyWith<$Res>(_self.body!, (value) {
    return _then(_self.copyWith(body: value));
  });
}
}


/// @nodoc
mixin _$KmaHeaderDto {

 String get resultCode; String get resultMsg;
/// Create a copy of KmaHeaderDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KmaHeaderDtoCopyWith<KmaHeaderDto> get copyWith => _$KmaHeaderDtoCopyWithImpl<KmaHeaderDto>(this as KmaHeaderDto, _$identity);

  /// Serializes this KmaHeaderDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KmaHeaderDto&&(identical(other.resultCode, resultCode) || other.resultCode == resultCode)&&(identical(other.resultMsg, resultMsg) || other.resultMsg == resultMsg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resultCode,resultMsg);

@override
String toString() {
  return 'KmaHeaderDto(resultCode: $resultCode, resultMsg: $resultMsg)';
}


}

/// @nodoc
abstract mixin class $KmaHeaderDtoCopyWith<$Res>  {
  factory $KmaHeaderDtoCopyWith(KmaHeaderDto value, $Res Function(KmaHeaderDto) _then) = _$KmaHeaderDtoCopyWithImpl;
@useResult
$Res call({
 String resultCode, String resultMsg
});




}
/// @nodoc
class _$KmaHeaderDtoCopyWithImpl<$Res>
    implements $KmaHeaderDtoCopyWith<$Res> {
  _$KmaHeaderDtoCopyWithImpl(this._self, this._then);

  final KmaHeaderDto _self;
  final $Res Function(KmaHeaderDto) _then;

/// Create a copy of KmaHeaderDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resultCode = null,Object? resultMsg = null,}) {
  return _then(_self.copyWith(
resultCode: null == resultCode ? _self.resultCode : resultCode // ignore: cast_nullable_to_non_nullable
as String,resultMsg: null == resultMsg ? _self.resultMsg : resultMsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _KmaHeaderDto implements KmaHeaderDto {
  const _KmaHeaderDto({required this.resultCode, required this.resultMsg});
  factory _KmaHeaderDto.fromJson(Map<String, dynamic> json) => _$KmaHeaderDtoFromJson(json);

@override final  String resultCode;
@override final  String resultMsg;

/// Create a copy of KmaHeaderDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KmaHeaderDtoCopyWith<_KmaHeaderDto> get copyWith => __$KmaHeaderDtoCopyWithImpl<_KmaHeaderDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KmaHeaderDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KmaHeaderDto&&(identical(other.resultCode, resultCode) || other.resultCode == resultCode)&&(identical(other.resultMsg, resultMsg) || other.resultMsg == resultMsg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resultCode,resultMsg);

@override
String toString() {
  return 'KmaHeaderDto(resultCode: $resultCode, resultMsg: $resultMsg)';
}


}

/// @nodoc
abstract mixin class _$KmaHeaderDtoCopyWith<$Res> implements $KmaHeaderDtoCopyWith<$Res> {
  factory _$KmaHeaderDtoCopyWith(_KmaHeaderDto value, $Res Function(_KmaHeaderDto) _then) = __$KmaHeaderDtoCopyWithImpl;
@override @useResult
$Res call({
 String resultCode, String resultMsg
});




}
/// @nodoc
class __$KmaHeaderDtoCopyWithImpl<$Res>
    implements _$KmaHeaderDtoCopyWith<$Res> {
  __$KmaHeaderDtoCopyWithImpl(this._self, this._then);

  final _KmaHeaderDto _self;
  final $Res Function(_KmaHeaderDto) _then;

/// Create a copy of KmaHeaderDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resultCode = null,Object? resultMsg = null,}) {
  return _then(_KmaHeaderDto(
resultCode: null == resultCode ? _self.resultCode : resultCode // ignore: cast_nullable_to_non_nullable
as String,resultMsg: null == resultMsg ? _self.resultMsg : resultMsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$KmaBodyDto {

 String get dataType; KmaItemsDto get items; int get pageNo; int get numOfRows; int get totalCount;
/// Create a copy of KmaBodyDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KmaBodyDtoCopyWith<KmaBodyDto> get copyWith => _$KmaBodyDtoCopyWithImpl<KmaBodyDto>(this as KmaBodyDto, _$identity);

  /// Serializes this KmaBodyDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KmaBodyDto&&(identical(other.dataType, dataType) || other.dataType == dataType)&&(identical(other.items, items) || other.items == items)&&(identical(other.pageNo, pageNo) || other.pageNo == pageNo)&&(identical(other.numOfRows, numOfRows) || other.numOfRows == numOfRows)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dataType,items,pageNo,numOfRows,totalCount);

@override
String toString() {
  return 'KmaBodyDto(dataType: $dataType, items: $items, pageNo: $pageNo, numOfRows: $numOfRows, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $KmaBodyDtoCopyWith<$Res>  {
  factory $KmaBodyDtoCopyWith(KmaBodyDto value, $Res Function(KmaBodyDto) _then) = _$KmaBodyDtoCopyWithImpl;
@useResult
$Res call({
 String dataType, KmaItemsDto items, int pageNo, int numOfRows, int totalCount
});


$KmaItemsDtoCopyWith<$Res> get items;

}
/// @nodoc
class _$KmaBodyDtoCopyWithImpl<$Res>
    implements $KmaBodyDtoCopyWith<$Res> {
  _$KmaBodyDtoCopyWithImpl(this._self, this._then);

  final KmaBodyDto _self;
  final $Res Function(KmaBodyDto) _then;

/// Create a copy of KmaBodyDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dataType = null,Object? items = null,Object? pageNo = null,Object? numOfRows = null,Object? totalCount = null,}) {
  return _then(_self.copyWith(
dataType: null == dataType ? _self.dataType : dataType // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as KmaItemsDto,pageNo: null == pageNo ? _self.pageNo : pageNo // ignore: cast_nullable_to_non_nullable
as int,numOfRows: null == numOfRows ? _self.numOfRows : numOfRows // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of KmaBodyDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KmaItemsDtoCopyWith<$Res> get items {
  
  return $KmaItemsDtoCopyWith<$Res>(_self.items, (value) {
    return _then(_self.copyWith(items: value));
  });
}
}


/// @nodoc

@JsonSerializable(explicitToJson: true)
class _KmaBodyDto implements KmaBodyDto {
  const _KmaBodyDto({required this.dataType, required this.items, required this.pageNo, required this.numOfRows, required this.totalCount});
  factory _KmaBodyDto.fromJson(Map<String, dynamic> json) => _$KmaBodyDtoFromJson(json);

@override final  String dataType;
@override final  KmaItemsDto items;
@override final  int pageNo;
@override final  int numOfRows;
@override final  int totalCount;

/// Create a copy of KmaBodyDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KmaBodyDtoCopyWith<_KmaBodyDto> get copyWith => __$KmaBodyDtoCopyWithImpl<_KmaBodyDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KmaBodyDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KmaBodyDto&&(identical(other.dataType, dataType) || other.dataType == dataType)&&(identical(other.items, items) || other.items == items)&&(identical(other.pageNo, pageNo) || other.pageNo == pageNo)&&(identical(other.numOfRows, numOfRows) || other.numOfRows == numOfRows)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dataType,items,pageNo,numOfRows,totalCount);

@override
String toString() {
  return 'KmaBodyDto(dataType: $dataType, items: $items, pageNo: $pageNo, numOfRows: $numOfRows, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$KmaBodyDtoCopyWith<$Res> implements $KmaBodyDtoCopyWith<$Res> {
  factory _$KmaBodyDtoCopyWith(_KmaBodyDto value, $Res Function(_KmaBodyDto) _then) = __$KmaBodyDtoCopyWithImpl;
@override @useResult
$Res call({
 String dataType, KmaItemsDto items, int pageNo, int numOfRows, int totalCount
});


@override $KmaItemsDtoCopyWith<$Res> get items;

}
/// @nodoc
class __$KmaBodyDtoCopyWithImpl<$Res>
    implements _$KmaBodyDtoCopyWith<$Res> {
  __$KmaBodyDtoCopyWithImpl(this._self, this._then);

  final _KmaBodyDto _self;
  final $Res Function(_KmaBodyDto) _then;

/// Create a copy of KmaBodyDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dataType = null,Object? items = null,Object? pageNo = null,Object? numOfRows = null,Object? totalCount = null,}) {
  return _then(_KmaBodyDto(
dataType: null == dataType ? _self.dataType : dataType // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as KmaItemsDto,pageNo: null == pageNo ? _self.pageNo : pageNo // ignore: cast_nullable_to_non_nullable
as int,numOfRows: null == numOfRows ? _self.numOfRows : numOfRows // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of KmaBodyDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$KmaItemsDtoCopyWith<$Res> get items {
  
  return $KmaItemsDtoCopyWith<$Res>(_self.items, (value) {
    return _then(_self.copyWith(items: value));
  });
}
}


/// @nodoc
mixin _$KmaItemsDto {

// API에서 item이 단일 객체일 경우도 있고, 여러 개일 경우 리스트일 수 있습니다.
// 일반적으로 리스트로 오므로 List<KmaItemDto>로 처리합니다.
// 만약 단일 객체인데 List로 파싱하려고 하면 에러가 발생할 수 있으니,
// 실제 API 명세에 따라 List<KmaItemDto> 또는 KmaItemDto 단일 객체로 변경해야 합니다.
// 제공된 JSON에서는 List<KmaItemDto>가 맞습니다.
 List<KmaItemDto> get item;
/// Create a copy of KmaItemsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KmaItemsDtoCopyWith<KmaItemsDto> get copyWith => _$KmaItemsDtoCopyWithImpl<KmaItemsDto>(this as KmaItemsDto, _$identity);

  /// Serializes this KmaItemsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KmaItemsDto&&const DeepCollectionEquality().equals(other.item, item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(item));

@override
String toString() {
  return 'KmaItemsDto(item: $item)';
}


}

/// @nodoc
abstract mixin class $KmaItemsDtoCopyWith<$Res>  {
  factory $KmaItemsDtoCopyWith(KmaItemsDto value, $Res Function(KmaItemsDto) _then) = _$KmaItemsDtoCopyWithImpl;
@useResult
$Res call({
 List<KmaItemDto> item
});




}
/// @nodoc
class _$KmaItemsDtoCopyWithImpl<$Res>
    implements $KmaItemsDtoCopyWith<$Res> {
  _$KmaItemsDtoCopyWithImpl(this._self, this._then);

  final KmaItemsDto _self;
  final $Res Function(KmaItemsDto) _then;

/// Create a copy of KmaItemsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,}) {
  return _then(_self.copyWith(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as List<KmaItemDto>,
  ));
}

}


/// @nodoc

@JsonSerializable(explicitToJson: true)
class _KmaItemsDto implements KmaItemsDto {
  const _KmaItemsDto({required final  List<KmaItemDto> item}): _item = item;
  factory _KmaItemsDto.fromJson(Map<String, dynamic> json) => _$KmaItemsDtoFromJson(json);

// API에서 item이 단일 객체일 경우도 있고, 여러 개일 경우 리스트일 수 있습니다.
// 일반적으로 리스트로 오므로 List<KmaItemDto>로 처리합니다.
// 만약 단일 객체인데 List로 파싱하려고 하면 에러가 발생할 수 있으니,
// 실제 API 명세에 따라 List<KmaItemDto> 또는 KmaItemDto 단일 객체로 변경해야 합니다.
// 제공된 JSON에서는 List<KmaItemDto>가 맞습니다.
 final  List<KmaItemDto> _item;
// API에서 item이 단일 객체일 경우도 있고, 여러 개일 경우 리스트일 수 있습니다.
// 일반적으로 리스트로 오므로 List<KmaItemDto>로 처리합니다.
// 만약 단일 객체인데 List로 파싱하려고 하면 에러가 발생할 수 있으니,
// 실제 API 명세에 따라 List<KmaItemDto> 또는 KmaItemDto 단일 객체로 변경해야 합니다.
// 제공된 JSON에서는 List<KmaItemDto>가 맞습니다.
@override List<KmaItemDto> get item {
  if (_item is EqualUnmodifiableListView) return _item;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_item);
}


/// Create a copy of KmaItemsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KmaItemsDtoCopyWith<_KmaItemsDto> get copyWith => __$KmaItemsDtoCopyWithImpl<_KmaItemsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KmaItemsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KmaItemsDto&&const DeepCollectionEquality().equals(other._item, _item));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_item));

@override
String toString() {
  return 'KmaItemsDto(item: $item)';
}


}

/// @nodoc
abstract mixin class _$KmaItemsDtoCopyWith<$Res> implements $KmaItemsDtoCopyWith<$Res> {
  factory _$KmaItemsDtoCopyWith(_KmaItemsDto value, $Res Function(_KmaItemsDto) _then) = __$KmaItemsDtoCopyWithImpl;
@override @useResult
$Res call({
 List<KmaItemDto> item
});




}
/// @nodoc
class __$KmaItemsDtoCopyWithImpl<$Res>
    implements _$KmaItemsDtoCopyWith<$Res> {
  __$KmaItemsDtoCopyWithImpl(this._self, this._then);

  final _KmaItemsDto _self;
  final $Res Function(_KmaItemsDto) _then;

/// Create a copy of KmaItemsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(_KmaItemsDto(
item: null == item ? _self._item : item // ignore: cast_nullable_to_non_nullable
as List<KmaItemDto>,
  ));
}


}


/// @nodoc
mixin _$KmaItemDto {

 String get baseDate;// 발표일자 (YYYYMMDD)
 String get baseTime;// 발표시각 (HHMM)
 String get category;// 자료구분코드 (TMP, POP, SKY 등)
 String get fcstDate;// 예보일자 (YYYYMMDD)
 String get fcstTime;// 예보시각 (HHMM)
 String get fcstValue;// 예보 값 (문자열이므로 파싱 필요)
 int get nx;// 예보지점 X 좌표
 int get ny;
/// Create a copy of KmaItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KmaItemDtoCopyWith<KmaItemDto> get copyWith => _$KmaItemDtoCopyWithImpl<KmaItemDto>(this as KmaItemDto, _$identity);

  /// Serializes this KmaItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KmaItemDto&&(identical(other.baseDate, baseDate) || other.baseDate == baseDate)&&(identical(other.baseTime, baseTime) || other.baseTime == baseTime)&&(identical(other.category, category) || other.category == category)&&(identical(other.fcstDate, fcstDate) || other.fcstDate == fcstDate)&&(identical(other.fcstTime, fcstTime) || other.fcstTime == fcstTime)&&(identical(other.fcstValue, fcstValue) || other.fcstValue == fcstValue)&&(identical(other.nx, nx) || other.nx == nx)&&(identical(other.ny, ny) || other.ny == ny));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseDate,baseTime,category,fcstDate,fcstTime,fcstValue,nx,ny);

@override
String toString() {
  return 'KmaItemDto(baseDate: $baseDate, baseTime: $baseTime, category: $category, fcstDate: $fcstDate, fcstTime: $fcstTime, fcstValue: $fcstValue, nx: $nx, ny: $ny)';
}


}

/// @nodoc
abstract mixin class $KmaItemDtoCopyWith<$Res>  {
  factory $KmaItemDtoCopyWith(KmaItemDto value, $Res Function(KmaItemDto) _then) = _$KmaItemDtoCopyWithImpl;
@useResult
$Res call({
 String baseDate, String baseTime, String category, String fcstDate, String fcstTime, String fcstValue, int nx, int ny
});




}
/// @nodoc
class _$KmaItemDtoCopyWithImpl<$Res>
    implements $KmaItemDtoCopyWith<$Res> {
  _$KmaItemDtoCopyWithImpl(this._self, this._then);

  final KmaItemDto _self;
  final $Res Function(KmaItemDto) _then;

/// Create a copy of KmaItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baseDate = null,Object? baseTime = null,Object? category = null,Object? fcstDate = null,Object? fcstTime = null,Object? fcstValue = null,Object? nx = null,Object? ny = null,}) {
  return _then(_self.copyWith(
baseDate: null == baseDate ? _self.baseDate : baseDate // ignore: cast_nullable_to_non_nullable
as String,baseTime: null == baseTime ? _self.baseTime : baseTime // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,fcstDate: null == fcstDate ? _self.fcstDate : fcstDate // ignore: cast_nullable_to_non_nullable
as String,fcstTime: null == fcstTime ? _self.fcstTime : fcstTime // ignore: cast_nullable_to_non_nullable
as String,fcstValue: null == fcstValue ? _self.fcstValue : fcstValue // ignore: cast_nullable_to_non_nullable
as String,nx: null == nx ? _self.nx : nx // ignore: cast_nullable_to_non_nullable
as int,ny: null == ny ? _self.ny : ny // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _KmaItemDto implements KmaItemDto {
  const _KmaItemDto({required this.baseDate, required this.baseTime, required this.category, required this.fcstDate, required this.fcstTime, required this.fcstValue, required this.nx, required this.ny});
  factory _KmaItemDto.fromJson(Map<String, dynamic> json) => _$KmaItemDtoFromJson(json);

@override final  String baseDate;
// 발표일자 (YYYYMMDD)
@override final  String baseTime;
// 발표시각 (HHMM)
@override final  String category;
// 자료구분코드 (TMP, POP, SKY 등)
@override final  String fcstDate;
// 예보일자 (YYYYMMDD)
@override final  String fcstTime;
// 예보시각 (HHMM)
@override final  String fcstValue;
// 예보 값 (문자열이므로 파싱 필요)
@override final  int nx;
// 예보지점 X 좌표
@override final  int ny;

/// Create a copy of KmaItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KmaItemDtoCopyWith<_KmaItemDto> get copyWith => __$KmaItemDtoCopyWithImpl<_KmaItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KmaItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KmaItemDto&&(identical(other.baseDate, baseDate) || other.baseDate == baseDate)&&(identical(other.baseTime, baseTime) || other.baseTime == baseTime)&&(identical(other.category, category) || other.category == category)&&(identical(other.fcstDate, fcstDate) || other.fcstDate == fcstDate)&&(identical(other.fcstTime, fcstTime) || other.fcstTime == fcstTime)&&(identical(other.fcstValue, fcstValue) || other.fcstValue == fcstValue)&&(identical(other.nx, nx) || other.nx == nx)&&(identical(other.ny, ny) || other.ny == ny));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseDate,baseTime,category,fcstDate,fcstTime,fcstValue,nx,ny);

@override
String toString() {
  return 'KmaItemDto(baseDate: $baseDate, baseTime: $baseTime, category: $category, fcstDate: $fcstDate, fcstTime: $fcstTime, fcstValue: $fcstValue, nx: $nx, ny: $ny)';
}


}

/// @nodoc
abstract mixin class _$KmaItemDtoCopyWith<$Res> implements $KmaItemDtoCopyWith<$Res> {
  factory _$KmaItemDtoCopyWith(_KmaItemDto value, $Res Function(_KmaItemDto) _then) = __$KmaItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String baseDate, String baseTime, String category, String fcstDate, String fcstTime, String fcstValue, int nx, int ny
});




}
/// @nodoc
class __$KmaItemDtoCopyWithImpl<$Res>
    implements _$KmaItemDtoCopyWith<$Res> {
  __$KmaItemDtoCopyWithImpl(this._self, this._then);

  final _KmaItemDto _self;
  final $Res Function(_KmaItemDto) _then;

/// Create a copy of KmaItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baseDate = null,Object? baseTime = null,Object? category = null,Object? fcstDate = null,Object? fcstTime = null,Object? fcstValue = null,Object? nx = null,Object? ny = null,}) {
  return _then(_KmaItemDto(
baseDate: null == baseDate ? _self.baseDate : baseDate // ignore: cast_nullable_to_non_nullable
as String,baseTime: null == baseTime ? _self.baseTime : baseTime // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,fcstDate: null == fcstDate ? _self.fcstDate : fcstDate // ignore: cast_nullable_to_non_nullable
as String,fcstTime: null == fcstTime ? _self.fcstTime : fcstTime // ignore: cast_nullable_to_non_nullable
as String,fcstValue: null == fcstValue ? _self.fcstValue : fcstValue // ignore: cast_nullable_to_non_nullable
as String,nx: null == nx ? _self.nx : nx // ignore: cast_nullable_to_non_nullable
as int,ny: null == ny ? _self.ny : ny // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
