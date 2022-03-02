import 'package:json_annotation/json_annotation.dart';
part 'Consumption.g.dart';
@JsonSerializable()
class Consumption {
  Consumption({
      this.collectionCount, 
      this.shareCount, 
      this.replyCount, 
      this.realCollectionCount,});


  int? collectionCount;
  int? shareCount;
  int? replyCount;
  int? realCollectionCount;


factory Consumption.fromJson(Map<String, dynamic> json) => _$ConsumptionFromJson(json);

Map<String, dynamic> toJson() => _$ConsumptionToJson(this);

}