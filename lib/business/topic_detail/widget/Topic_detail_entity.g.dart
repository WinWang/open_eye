// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Topic_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicDetailEntity _$TopicDetailEntityFromJson(Map<String, dynamic> json) =>
    TopicDetailEntity(
      id: json['id'] as int?,
      headerImage: json['headerImage'] as String?,
      brief: json['brief'] as String?,
      text: json['text'] as String?,
      shareLink: json['shareLink'] as String?,
      count: json['count'] as int?,
      itemList:
          json['itemList'] == null ? null : ItemList.fromJson(json['itemList']),
    );

Map<String, dynamic> _$TopicDetailEntityToJson(TopicDetailEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'headerImage': instance.headerImage,
      'brief': instance.brief,
      'text': instance.text,
      'shareLink': instance.shareLink,
      'count': instance.count,
      'itemList': instance.itemList?.toJson(),
    };
