// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_page_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasePageRusult<T> _$BasePageRusultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BasePageRusult<T>(
      json['offse'] as int?,
      json['size'] as int?,
      json['pageCount'] as int?,
      json['total'] as int?,
      (json['datas'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$BasePageRusultToJson<T>(
  BasePageRusult<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'offse': instance.offset,
      'size': instance.size,
      'pageCount': instance.pageCount,
      'total': instance.total,
      'datas': instance.datas?.map(toJsonT).toList(),
    };
