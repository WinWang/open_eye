// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_wan_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseWanResult<T> _$BaseWanResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseWanResult<T>(
      json['errorCode'] as int?,
      json['errorMsg'] as String?,
      _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$BaseWanResultToJson<T>(
  BaseWanResult<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
