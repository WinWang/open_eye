import 'package:json_annotation/json_annotation.dart';
import 'package:open_eye/business/find_page/model/ItemList.dart';

part 'Topic_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class TopicDetailEntity {
  TopicDetailEntity(
      {this.id,
      this.headerImage,
      this.brief,
      this.text,
      this.shareLink,
      this.count,
      this.itemList});

  int? id;
  String? headerImage;
  String? brief;
  String? text;
  String? shareLink;
  int? count;
  ItemList? itemList;

  factory TopicDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$TopicDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TopicDetailEntityToJson(this);
}
