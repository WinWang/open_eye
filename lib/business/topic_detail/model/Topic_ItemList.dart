import 'package:json_annotation/json_annotation.dart';
import 'package:open_eye/business/find_page/model/Focus_Data_entity.dart';

part 'Topic_ItemList.g.dart';
@JsonSerializable(explicitToJson: true)
class TopicItemList {
  TopicItemList({
    this.type,
    this.data,
    this.trackingData,
    this.tag,
    this.id,
    this.adIndex,
  });

  String? type;
  FocusDataEntity? data;
  dynamic trackingData;
  dynamic tag;
  int? id;
  int? adIndex;

factory TopicItemList.fromJson(Map<String, dynamic> json) => _$TopicItemListFromJson(json);

Map<String, dynamic> toJson() => _$TopicItemListToJson(this);
}
