// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Topic_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicEntity _$TopicEntityFromJson(Map<String, dynamic> json) => TopicEntity(
      itemList: (json['itemList'] as List<dynamic>?)
          ?.map((e) => TopicDataEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int?,
      total: json['total'] as int?,
      nextPageUrl: json['nextPageUrl'] as String?,
      adExist: json['adExist'] as bool?,
    );

Map<String, dynamic> _$TopicEntityToJson(TopicEntity instance) =>
    <String, dynamic>{
      'itemList': instance.itemList?.map((e) => e.toJson()).toList(),
      'count': instance.count,
      'total': instance.total,
      'nextPageUrl': instance.nextPageUrl,
      'adExist': instance.adExist,
    };
