// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResult<T> _$BaseResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResult<T>(
      resCode: json['resCode'] as String?,
      resMessage: json['resMessage'] as String?,
      resObject: _$nullableGenericFromJson(json['resObject'], fromJsonT),
    );

Map<String, dynamic> _$BaseResultToJson<T>(
  BaseResult<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'resCode': instance.resCode,
      'resMessage': instance.resMessage,
      'resObject': _$nullableGenericToJson(instance.resObject, toJsonT),
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
