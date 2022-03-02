import 'package:json_annotation/json_annotation.dart';
import 'ItemList.dart';

part 'IssueList.g.dart';
@JsonSerializable(explicitToJson: true)
class IssueList {
  IssueList({
      this.releaseTime, 
      this.type, 
      this.date, 
      this.publishTime, 
      this.itemList, 
      this.count,});

  int? releaseTime;
  String? type;
  int? date;
  int? publishTime;
  List<ItemList>? itemList;
  int? count;


factory IssueList.fromJson(Map<String, dynamic> json) => _$IssueListFromJson(json);

Map<String, dynamic> toJson() => _$IssueListToJson(this);

}