import 'dart:io';

import 'package:dio/dio.dart';
import 'package:open_eye/constant/http_url.dart';
import 'package:open_eye/http/result/base_result.dart';
import 'package:open_eye/model/upload_img_entity.dart';
import 'package:retrofit/http.dart';

import '../dio_client.dart';

part 'common_api.g.dart';

///通用型API，不通过注解设定好BaseUrl，在接口请求上面path用户自定义
@RestApi()
abstract class CommonApi {
  ///图片上传接口
  factory CommonApi({Dio? dio, String? baseUrl}) {
    dio ??= DioClient().dio;
    return _CommonApi(dio, baseUrl: baseUrl);
  }

  @MultiPart()
  @POST("${HttpUrl.BAES_TZYK_URL}ams/uploadImage")
  Future<BaseResult<UploadImgEntity>> uploadImage(
      @Part(name: "image") File uploadMap);

}
