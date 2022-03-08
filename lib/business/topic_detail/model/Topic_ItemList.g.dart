// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Topic_ItemList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicItemList _$TopicItemListFromJson(Map<String, dynamic> json) =>
    TopicItemList(
      type: json['type'] as String?,
      data: json['data'] == null
          ? null
          : FocusDataEntity.fromJson(json['data'] as Map<String, dynamic>),
      trackingData: json['trackingData'],
      tag: json['tag'],
      id: json['id'] as int?,
      adIndex: json['adIndex'] as int?,
    );

Map<String, dynamic> _$TopicItemListToJson(TopicItemList instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data?.toJson(),
      'trackingData': instance.trackingData,
      'tag': instance.tag,
      'id': instance.id,
      'adIndex': instance.adIndex,
    };
