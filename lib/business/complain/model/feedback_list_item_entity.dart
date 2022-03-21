import 'package:json_annotation/json_annotation.dart';

part 'feedback_list_item_entity.g.dart';

@JsonSerializable()
class FeedbackListItemEntity {
  FeedbackListItemEntity({
    this.userName,
    this.replyTime,
    this.content,
    this.contentType,
    this.type,
  });

  String? userName;
  String? replyTime;
  String? content;
  int? contentType;
  int? type;

  factory FeedbackListItemEntity.fromJson(Map<String, dynamic> json) =>
      _$FeedbackListItemEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackListItemEntityToJson(this);
}
