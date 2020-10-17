import 'dart:ui';
import 'package:device_info/device_info.dart';
import 'package:first_flutter/screen/size_fit.dart';
import 'package:first_flutter/screen/double_extension.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize();
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("屏幕适配"),
      ),
      body: Center(
        child: Container(
          width: SizeFit.px2dpr(600.0),
          height: 600.0.px,
          color: Colors.red,
          alignment: Alignment.center,
          child: Text(
            "Hello Flutter",
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

/// 获取【屏幕】和【设备】信息的工具类
class DeviceInfoUtils {
  /// 获取屏幕信息
  ///     从结果看，devicePixelRatio含义和Android中的dp是一样的
  ///     因此，逻辑尺寸 = 实际尺寸 / dpr
  static void getWindowInfo(BuildContext context) {
    /// 注意：假如在MyApp()中调使用【MediaQuery】的API会报错，是因为【MediaQuery】未初始化完成导致的
    ///      所以获取屏幕信息，建议直接使用【window】
    final mediaQuery = MediaQuery.of(context);
    print("屏幕逻辑宽高：${mediaQuery.size.width}, ${mediaQuery.size.height}");
    print("屏幕实际宽高：${window.physicalSize.width}, ${window.physicalSize.height}");
    print("设备像素比率：${window.devicePixelRatio}");
  }

  /// 获取设备信息
  static void getDeviceInfo() {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    print("getDeviceInfo start");
    deviceInfo.androidInfo.then((value) {
      print("androidId is ${value.androidId}");
    });
    print("getDeviceInfo end");
  }
}
