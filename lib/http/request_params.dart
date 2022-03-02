/// 通用请求参数封装
class RequestParams {
  RequestParams();

  final Map<String, dynamic> _params = {};

  RequestParams put(String key, dynamic value) {
    if (value != null) {
      _params[key] = value;
    }
    return this;
  }

  void remove(String key) {
    _params.remove(key);
  }

  Map<String, dynamic> getRequestBody() {
    return _params;
  }
}
