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
    );

Map<String, dynamic> _$FocusDataEntityToJson(FocusDataEntity instance) =>
    <String, dynamic>{
      'header': instance.header?.toJson(),
      'itemList': instance.itemList?.map((e) => e.toJson()).toList(),
      'dataType': instance.dataType,
    };
