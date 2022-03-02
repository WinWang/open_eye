// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Shield.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shield _$ShieldFromJson(Map<String, dynamic> json) => Shield(
      itemType: json['itemType'] as String?,
      itemId: json['itemId'] as int?,
      shielded: json['shielded'] as bool?,
    );

Map<String, dynamic> _$ShieldToJson(Shield instance) => <String, dynamic>{
      'itemType': instance.itemType,
      'itemId': instance.itemId,
      'shielded': instance.shielded,
    };
