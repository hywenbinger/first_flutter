import 'dart:io';

import 'dart:math';

main() {
  print("main start");

//  var future = getNetData();
//  future.then((String value) {
//    print(value);
//  }).catchError((error) {
//    print(error);
//  }).whenComplete(() => print("请求结束，更新UI"));

//  emulateLinkCall();

  testOtherAPI();

  print("main end");
}

/// 模拟一个网络请求
///    1. 将耗时操作包裹到Future的回调函数中
///    2. 使用Future.then()方法获取返回值
///    3. 使用Future.catchError()方法捕获异常
///    4. 在Future.whenComplete()中处理结束后的逻辑操作
Future<String> getNetData() {
  return Future<String>(() {
    print("get data start");
    sleep(
      Duration(seconds: 2),
    );
    print("get data end");
    int flag = Random().nextInt(100);
    print(flag);
    if (flag % 2 == 0) {
      return "请求到数据了";
    } else {
      throw Exception("异常啦");
    }
  });
}

/// 演示Future的链式调用
void emulateLinkCall() {
  Future(() {
    sleep(Duration(seconds: 2));
    if (Random().nextInt(100) % 2 == 0) {
      return "第一次网络请求结果";
    } else {
      throw Exception("第一次网络请求异常啦");
    }
  }).then((value) {
    print(value);
    sleep(Duration(seconds: 2));
    if (Random().nextInt(100) % 2 == 0) {
      return "第二次网络请求结果";
    } else {
      throw Exception("第二次网络请求异常啦");
    }
  }).then((value) {
    print(value);
  }).catchError((error) {
    print(error);
  }).whenComplete(() {
    print("请求结束");
  });
}

/// Future的其他API
void testOtherAPI() {
  Future.value("This is value").then((value) => print(value));

  Future.error("This is error").catchError((error) => print(error));

  Future.delayed(Duration(seconds: 2), () {
    return "延迟两秒返回";
  }).then((value) => print(value));
}
