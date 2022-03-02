import 'package:json_annotation/json_annotation.dart';
import 'package:open_eye/business/home_page/model/ItemList.dart';

import 'Follow.dart';

part 'Header_entity.g.dart';
@JsonSerializable(explicitToJson: true)
class HeaderEntity {
  HeaderEntity({
    this.id,
    this.icon,
    this.iconType,
    this.title,
    this.subTitle,
    this.description,
    this.actionUrl,
    this.adTrack,
    this.follow,
    this.ifPgc,
    this.uid,
    this.ifShowNotificationIcon,
    this.expert,
    this.itemList
  });

  int? id;
  String? icon;
  String? iconType;
  String? title;
  dynamic subTitle;
  String? description;
  String? actionUrl;
  dynamic adTrack;
  Follow? follow;
  bool? ifPgc;
  int? uid;
  bool? ifShowNotificationIcon;
  bool? expert;
  List<ItemList>? itemList;

factory HeaderEntity.fromJson(Map<String, dynamic> json) => _$HeaderEntityFromJson(json);

Map<String, dynamic> toJson() => _$HeaderEntityToJson(this);
}
