import 'package:json_annotation/json_annotation.dart';

part 'Topic_item_entity.g.dart';

@JsonSerializable()
class TopicItemEntity {
  String? title;
  int? id;
  String? image;

  TopicItemEntity(this.title, this.id, this.image);

  factory TopicItemEntity.fromJson(Map<String, dynamic> json) =>
      _$TopicItemEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TopicItemEntityToJson(this);
}
