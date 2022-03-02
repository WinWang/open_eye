import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:open_eye/constant/api_constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'interceptor/error_interceptor.dart';
import 'interceptor/http_params_interceptor.dart';

////Dio客户端
class DioClient {
  static void initClient({
    required String baseUrl,
    int connectTimeout = CONNECT_TIMEOUT,
    int receiveTimeout = RECEIVE_TIMEOUT,
    List<Interceptor>? interceptors,
  }) {
    DioClient().init(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      interceptors: interceptors,
    );
  }

  ///超时时间
  static const int CONNECT_TIMEOUT = 15000;
  static const int RECEIVE_TIMEOUT = 15000;

  static final DioClient _instance = DioClient._internal();

  factory DioClient() => _instance;

  late Dio dio;

  DioClient._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = BaseOptions(
      connectTimeout: CONNECT_TIMEOUT,
      // 响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: RECEIVE_TIMEOUT,

      // Http请求头.
      headers: {},
    );

    dio = Dio(options);

    // 添加error拦截器
    dio.interceptors.add(ErrorInterceptor());
    dio.interceptors.add(HttpParamsInterceptor());
    dio.interceptors.add(PrettyDioLogger(
      // 添加日志格式化工具类
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    if (ApiConstant.PROXY_ENABLE) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (uri) {
          // return "PROXY $PROXY_IP:$PROXY_PORT";
          return "proxy";
        };
        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  ///初始化公共属性
  ///
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时赶时间
  /// [receiveTimeout] 接收超时赶时间
  /// [interceptors] 基础拦截器
  void init({
    String? baseUrl,
    int connectTimeout = CONNECT_TIMEOUT,
    int receiveTimeout = RECEIVE_TIMEOUT,
    Map<String, String>? headers,
    List<Interceptor>? interceptors,
  }) {
    dio.options = dio.options.copyWith(
      baseUrl: baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: headers ?? const {},
    );
    if (interceptors != null && interceptors.isNotEmpty) {
      dio.interceptors.addAll(interceptors);
    }
  }
}
