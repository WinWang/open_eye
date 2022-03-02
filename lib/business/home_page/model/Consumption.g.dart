// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Consumption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Consumption _$ConsumptionFromJson(Map<String, dynamic> json) => Consumption(
      collectionCount: json['collectionCount'] as int?,
      shareCount: json['shareCount'] as int?,
      replyCount: json['replyCount'] as int?,
      realCollectionCount: json['realCollectionCount'] as int?,
    );

Map<String, dynamic> _$ConsumptionToJson(Consumption instance) =>
    <String, dynamic>{
      'collectionCount': instance.collectionCount,
      'shareCount': instance.shareCount,
      'replyCount': instance.replyCount,
      'realCollectionCount': instance.realCollectionCount,
    };
