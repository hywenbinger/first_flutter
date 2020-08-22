import 'dart:io';

import 'package:dio/dio.dart';

import 'http_config.dart';

class HttpRequest {
  static final _dio = Dio(_options);

  static final _options = BaseOptions(
      baseUrl: HTTPConfig.BASE_URL, connectTimeout: HTTPConfig.CONNECT_TIMEOUT);

  static Future<T> request<T>(String url,
      {String method = HTTPConfig.GET,
      Map<String, dynamic> params,
      Function(T t) onSuccess,
      Function(String error) onError}) async {
    var result;
    try {
      final response = await _dio.request(url,
          queryParameters: params, options: Options(method: method));
      result = response.data;
//      print("响应数据： ${response.toString()}");
      if (response.statusCode == HttpStatus.ok) {
        if (onSuccess != null) {
          onSuccess(result);
        }
      } else {
        throw Exception("statusCode: ${response.statusCode}");
      }
    } on DioError catch (e) {
      result = "";
//      print("请求出错：  ${e.toString()}");
      if (onError != null) {
        onError(e.toString());
      }
    }
    return result;
  }
}
