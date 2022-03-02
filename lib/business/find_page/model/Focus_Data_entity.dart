import 'package:json_annotation/json_annotation.dart';
import 'package:open_eye/business/home_page/model/ItemList.dart';

import 'Header_entity.dart';

part 'Focus_Data_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class FocusDataEntity {
  HeaderEntity? header;
  List<ItemList>? itemList;
  String? dataType;

  FocusDataEntity(this.header, this.itemList, this.dataType);

  factory FocusDataEntity.fromJson(Map<String, dynamic> json) =>
      _$FocusDataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FocusDataEntityToJson(this);
}
