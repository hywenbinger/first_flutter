import 'dart:io';

import 'package:dio/dio.dart';
import 'package:first_flutter/http/http_config.dart';
import 'package:first_flutter/http/http_request.dart';

main() {
  print("main start");

//  getHttp();

  HttpRequest.request("get",
          params: {"name": "wayne", 'age': 18},
          onSuccess: (value) {
            print("callback success: $value");
          },
          onError: (error) {
            print("callback error: $error");
          })
      .then((res) {
    print("get result is $res");
  });

  HttpRequest.request("post",
      method: HTTPConfig.POST, params: {"name": "wayne", 'age': 18}).then((res) {
    print("post result is $res");
  });

  print("main end");
}

void getHttp() {
  Dio().get("http://123.207.32.32:8000/api/v1/recommend").then((value) {
    print("请求成功：$value");
  }).catchError((error) {
    print("请求失败：$error");
  });
}
