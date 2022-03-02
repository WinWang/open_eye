import 'package:json_annotation/json_annotation.dart';
import 'Data.dart';

part 'ItemList.g.dart';
@JsonSerializable(explicitToJson: true)
class ItemList {
  ItemList({
      this.type, 
      this.data, 
      this.id, 
      this.adIndex,});

  String? type;
  Data? data;
  int? id;
  int? adIndex;



factory ItemList.fromJson(Map<String, dynamic> json) => _$ItemListFromJson(json);

Map<String, dynamic> toJson() => _$ItemListToJson(this);

}