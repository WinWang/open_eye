import 'package:json_annotation/json_annotation.dart';
import 'Consumption.dart';
import 'Provider.dart';
import 'Author.dart';
import 'Cover.dart';
import 'WebUrl.dart';

part 'Data.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {
  Data(
      {this.dataType,
      this.id,
      this.title,
      this.description,
      this.library,
      this.consumption,
      this.resourceType,
      this.provider,
      this.category,
      this.author,
      this.cover,
      this.playUrl,
      this.duration,
      this.webUrl,
      this.releaseTime,
      this.ad,
      this.type,
      this.descriptionPgc,
      this.remark,
      this.ifLimitVideo,
      this.searchWeight,
      this.idx,
      this.date,
      this.descriptionEditor,
      this.collected,
      this.reallyCollected,
      this.played,
      this.image});

  String? dataType;
  int? id;
  String? title;
  String? description;
  String? library;
  Consumption? consumption;
  String? resourceType;
  Provider? provider;
  String? category;
  Author? author;
  Cover? cover;
  String? playUrl;
  int? duration;
  WebUrl? webUrl;
  int? releaseTime;
  bool? ad;
  String? type;
  String? descriptionPgc;
  String? remark;
  bool? ifLimitVideo;
  int? searchWeight;
  int? idx;
  int? date;
  String? descriptionEditor;
  bool? collected;
  bool? reallyCollected;
  bool? played;
  String? image;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
