import 'package:json_annotation/json_annotation.dart';

part 'Type_entity.g.dart';

@JsonSerializable()
class TypeEntity {
  TypeEntity({
    this.id,
    this.name,
    this.alias,
    this.description,
    this.bgPicture,
    this.bgColor,
    this.headerImage,
    this.defaultAuthorId,
    this.tagId,
  });

  int? id;
  String? name;
  dynamic alias;
  String? description;
  String? bgPicture;
  String? bgColor;
  String? headerImage;
  int? defaultAuthorId;
  int? tagId;

  factory TypeEntity.fromJson(Map<String, dynamic> json) =>
      _$TypeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TypeEntityToJson(this);
}
