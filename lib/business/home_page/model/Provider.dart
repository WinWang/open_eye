import 'package:json_annotation/json_annotation.dart';
part 'Provider.g.dart';
@JsonSerializable()
class Provider {
  Provider({
      this.name, 
      this.alias, 
      this.icon,});


  String? name;
  String? alias;
  String? icon;


factory Provider.fromJson(Map<String, dynamic> json) => _$ProviderFromJson(json);

Map<String, dynamic> toJson() => _$ProviderToJson(this);

}