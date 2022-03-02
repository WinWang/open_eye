// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ItemList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemList _$ItemListFromJson(Map<String, dynamic> json) => ItemList(
      type: json['type'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      id: json['id'] as int?,
      adIndex: json['adIndex'] as int?,
    );

Map<String, dynamic> _$ItemListToJson(ItemList instance) => <String, dynamic>{
      'type': instance.type,
      'data': instance.data?.toJson(),
      'id': instance.id,
      'adIndex': instance.adIndex,
    };
