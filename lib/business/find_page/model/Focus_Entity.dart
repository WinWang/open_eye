import 'package:json_annotation/json_annotation.dart';
import 'package:open_eye/business/find_page/model/Focus_Item_Entity.dart';

part 'Focus_Entity.g.dart';
@JsonSerializable(explicitToJson: true)
class FocusEntity {
  List<FocusItemEntity>? itemList;
  String? nextPageUrl;
  int? total;
  int? count;

  FocusEntity(this.itemList, this.nextPageUrl, this.total, this.count);

factory FocusEntity.fromJson(Map<String, dynamic> json) => _$FocusEntityFromJson(json);

Map<String, dynamic> toJson() => _$FocusEntityToJson(this);
}
