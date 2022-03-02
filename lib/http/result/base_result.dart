import 'package:json_annotation/json_annotation.dart';

/**
 * 大阳智投数据基类
 */

part 'base_result.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResult<T> {
  @JsonKey(name: "resCode")
  String? resCode;
  @JsonKey(name: "resMessage")
  String? resMessage;
  @JsonKey(name: "resObject")
  T? resObject;

  BaseResult({this.resCode, this.resMessage, this.resObject});

  factory BaseResult.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResultFromJson(json, fromJsonT);


  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseResultToJson(this, toJsonT);

}





