import 'package:json_annotation/json_annotation.dart';
import 'package:open_eye/business/find_page/model/Focus_Data_entity.dart';

part 'Focus_Item_Entity.g.dart';

@JsonSerializable(explicitToJson: true)
class FocusItemEntity {
  String? type;
  FocusDataEntity? data;
  int? id;


  FocusItemEntity(this.type, this.data, this.id);

  factory FocusItemEntity.fromJson(Map<String, dynamic> json) =>
      _$FocusItemEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FocusItemEntityToJson(this);
}
