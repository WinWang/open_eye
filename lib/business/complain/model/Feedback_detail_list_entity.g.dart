// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Feedback_detail_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackDetailListEntity _$FeedbackDetailListEntityFromJson(
        Map<String, dynamic> json) =>
    FeedbackDetailListEntity(
      list: (json['list'] as List<dynamic>?)
          ?.map(
              (e) => FeedbackListItemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedbackDetailListEntityToJson(
        FeedbackDetailListEntity instance) =>
    <String, dynamic>{
      'list': instance.list?.map((e) => e.toJson()).toList(),
    };
