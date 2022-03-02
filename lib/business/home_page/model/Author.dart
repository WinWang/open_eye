import 'package:json_annotation/json_annotation.dart';
import 'Follow.dart';
import 'Shield.dart';

part 'Author.g.dart';
@JsonSerializable(explicitToJson: true)
class Author {
  Author({
      this.id, 
      this.icon, 
      this.name, 
      this.description, 
      this.link, 
      this.latestReleaseTime, 
      this.videoNum, 
      this.follow, 
      this.shield, 
      this.approvedNotReadyVideoCount, 
      this.ifPgc, 
      this.recSort, 
      this.expert,});


  int? id;
  String? icon;
  String? name;
  String? description;
  String? link;
  int? latestReleaseTime;
  int? videoNum;
  Follow? follow;
  Shield? shield;
  int? approvedNotReadyVideoCount;
  bool? ifPgc;
  int? recSort;
  bool? expert;



factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

Map<String, dynamic> toJson() => _$AuthorToJson(this);

}