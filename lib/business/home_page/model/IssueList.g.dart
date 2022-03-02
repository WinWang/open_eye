// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IssueList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueList _$IssueListFromJson(Map<String, dynamic> json) => IssueList(
      releaseTime: json['releaseTime'] as int?,
      type: json['type'] as String?,
      date: json['date'] as int?,
      publishTime: json['publishTime'] as int?,
      itemList: (json['itemList'] as List<dynamic>?)
          ?.map((e) => ItemList.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int?,
    );

Map<String, dynamic> _$IssueListToJson(IssueList instance) => <String, dynamic>{
      'releaseTime': instance.releaseTime,
      'type': instance.type,
      'date': instance.date,
      'publishTime': instance.publishTime,
      'itemList': instance.itemList?.map((e) => e.toJson()).toList(),
      'count': instance.count,
    };
