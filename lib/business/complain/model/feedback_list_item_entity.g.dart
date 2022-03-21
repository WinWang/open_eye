// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_list_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackListItemEntity _$FeedbackListItemEntityFromJson(
        Map<String, dynamic> json) =>
    FeedbackListItemEntity(
      userName: json['userName'] as String?,
      replyTime: json['replyTime'] as String?,
      content: json['content'] as String?,
      contentType: json['contentType'] as int?,
      type: json['type'] as int?,
    );

Map<String, dynamic> _$FeedbackListItemEntityToJson(
        FeedbackListItemEntity instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'replyTime': instance.replyTime,
      'content': instance.content,
      'contentType': instance.contentType,
      'type': instance.type,
    };
