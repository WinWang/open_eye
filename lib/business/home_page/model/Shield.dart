import 'package:json_annotation/json_annotation.dart';
part 'Shield.g.dart';
@JsonSerializable()
class Shield {
  Shield({
      this.itemType, 
      this.itemId, 
      this.shielded,});


  String? itemType;
  int? itemId;
  bool? shielded;



factory Shield.fromJson(Map<String, dynamic> json) => _$ShieldFromJson(json);

Map<String, dynamic> toJson() => _$ShieldToJson(this);

}