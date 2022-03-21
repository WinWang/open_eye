// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CommonApi implements CommonApi {
  _CommonApi(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BaseResult<UploadImgEntity>> uploadImage(uploadMap) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
        'image',
        MultipartFile.fromFileSync(uploadMap.path,
            filename: uploadMap.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResult<UploadImgEntity>>(Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'multipart/form-data')
            .compose(_dio.options, 'https://test-tzyk.get88.cn/ams/uploadImage',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResult<UploadImgEntity>.fromJson(
      _result.data!,
      (json) => UploadImgEntity.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
