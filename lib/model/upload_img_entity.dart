import 'package:json_annotation/json_annotation.dart';
part 'upload_img_entity.g.dart';
@JsonSerializable()
class UploadImgEntity {

  String? imgUrl;

  UploadImgEntity(this.imgUrl);

factory UploadImgEntity.fromJson(Map<String, dynamic> json) => _$UploadImgEntityFromJson(json);

Map<String, dynamic> toJson() => _$UploadImgEntityToJson(this);
}
