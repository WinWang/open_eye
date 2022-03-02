// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Focus_Entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FocusEntity _$FocusEntityFromJson(Map<String, dynamic> json) => FocusEntity(
      (json['itemList'] as List<dynamic>?)
          ?.map((e) => FocusItemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['nextPageUrl'] as String?,
      json['total'] as int?,
      json['count'] as int?,
    );

Map<String, dynamic> _$FocusEntityToJson(FocusEntity instance) =>
    <String, dynamic>{
      'itemList': instance.itemList?.map((e) => e.toJson()).toList(),
      'nextPageUrl': instance.nextPageUrl,
      'total': instance.total,
      'count': instance.count,
    };
