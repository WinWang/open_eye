import 'package:dio/dio.dart';
import 'package:open_eye/business/find_page/model/Focus_Entity.dart';
import 'package:open_eye/business/find_page/model/Topic_entity.dart';
import 'package:open_eye/business/find_page/model/Type_entity.dart';
import 'package:open_eye/business/home_page/model/Feed_entity.dart';
import 'package:open_eye/constant/http_url.dart';
import 'package:retrofit/http.dart';

import '../dio_client.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: HttpUrl.BASE_URL)
abstract class ApiService {
  factory ApiService({Dio? dio, String? baseUrl}) {
    dio ??= DioClient().dio;
    return _ApiService(dio, baseUrl: baseUrl);
  }

  ///获取首页数据
  @GET("api/v2/feed")
  Future<FeedEntity> queryFeedData(
      @Query("date") String date, @Query("num") int pageIndex);

  ///获取分类数据
  @GET("api/v4/categories")
  Future<List<TypeEntity>> queryCategoryData();

  ///获取关注数据
  @GET("api/v4/tabs/follow")
  Future<FocusEntity> queryFocusData(@Query("start")int startId);

  ///获取专题数据
  @GET("api/v3/specialTopics")
  Future<TopicEntity> queryTopicData(@Query("start")int startId);


}
