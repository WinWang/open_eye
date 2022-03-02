// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Feed_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedEntity _$FeedEntityFromJson(Map<String, dynamic> json) => FeedEntity(
      issueList: (json['issueList'] as List<dynamic>?)
          ?.map((e) => IssueList.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageUrl: json['nextPageUrl'] as String?,
      nextPublishTime: json['nextPublishTime'] as int?,
      newestIssueType: json['newestIssueType'] as String?,
      date: json['date'] as int?,
    );

Map<String, dynamic> _$FeedEntityToJson(FeedEntity instance) =>
    <String, dynamic>{
      'issueList': instance.issueList?.map((e) => e.toJson()).toList(),
      'nextPageUrl': instance.nextPageUrl,
      'nextPublishTime': instance.nextPublishTime,
      'newestIssueType': instance.newestIssueType,
      'date': instance.date,
    };
