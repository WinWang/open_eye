// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Focus_Data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FocusDataEntity _$FocusDataEntityFromJson(Map<String, dynamic> json) =>
    FocusDataEntity(
      json['header'] == null
          ? null
          : HeaderEntity.fromJson(json['header'] as Map<String, dynamic>),
      (json['itemList'] as List<dynamic>?)
          ?.map((e) => ItemList.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['dataType'] as String?,
      json['cover'] == null
          ? null
          : Cover.fromJson(json['cover'] as Map<String, dynamic>),
      json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      json['category'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      json['playUrl'] as String?,
      json['id'] as int?,
      json['content'] == null
          ? null
          : ItemList.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FocusDataEntityToJson(FocusDataEntity instance) =>
    <String, dynamic>{
      'header': instance.header?.toJson(),
      'itemList': instance.itemList?.map((e) => e.toJson()).toList(),
      'dataType': instance.dataType,
      'cover': instance.cover?.toJson(),
      'author': instance.author?.toJson(),
      'category': instance.category,
      'title': instance.title,
      'description': instance.description,
      'playUrl': instance.playUrl,
      'id': instance.id,
      'content': instance.content?.toJson(),
    };
