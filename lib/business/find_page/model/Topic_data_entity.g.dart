// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Topic_data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicDataEntity _$TopicDataEntityFromJson(Map<String, dynamic> json) =>
    TopicDataEntity(
      json['data'] == null
          ? null
          : TopicItemEntity.fromJson(json['data'] as Map<String, dynamic>),
      json['type'] as String?,
    );

Map<String, dynamic> _$TopicDataEntityToJson(TopicDataEntity instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'type': instance.type,
    };
