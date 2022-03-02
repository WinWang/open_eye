// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Type_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeEntity _$TypeEntityFromJson(Map<String, dynamic> json) => TypeEntity(
      id: json['id'] as int?,
      name: json['name'] as String?,
      alias: json['alias'],
      description: json['description'] as String?,
      bgPicture: json['bgPicture'] as String?,
      bgColor: json['bgColor'] as String?,
      headerImage: json['headerImage'] as String?,
      defaultAuthorId: json['defaultAuthorId'] as int?,
      tagId: json['tagId'] as int?,
    );

Map<String, dynamic> _$TypeEntityToJson(TypeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'alias': instance.alias,
      'description': instance.description,
      'bgPicture': instance.bgPicture,
      'bgColor': instance.bgColor,
      'headerImage': instance.headerImage,
      'defaultAuthorId': instance.defaultAuthorId,
      'tagId': instance.tagId,
    };
