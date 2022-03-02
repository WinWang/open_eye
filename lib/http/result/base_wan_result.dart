import 'package:json_annotation/json_annotation.dart';

/**
 * wanAndroid数据基类
 */
part 'base_wan_result.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseWanResult<T> {
  @JsonKey(name: "errorCode")
  int? errorCode;
  @JsonKey(name: "errorMsg")
  String? errorMsg;
  @JsonKey(name: "data")
  T? data;

  BaseWanResult(this.errorCode, this.errorMsg, this.data);

  factory BaseWanResult.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseWanResultFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$BaseWanResultToJson(this, toJsonT);
}
