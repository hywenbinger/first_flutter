import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 获取电量信息
///     1.与【原生代码】交互
///
/// 平台通道(platform channels)：
///     1.消息使用平台通道(platform channels)在客户端(UI)和宿主(平台)之间传递；
///     2.消息和响应以异步的形式进行传递，以确保用户界面能够保持响应；
///
/// 调用过程：
///     1.客户端(Flutter端)发送与方法调用相对应的消息；
///     2.平台端(IOS、Android端)接收方法，并返回结果；
///         * IOS端通过【FlutterMethodChannel】做出响应；
///         * Android端通过【MethodChannel】做出响应；
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        title: Text("获取电量信息"),
      ),
      body: MyContentBody(),
    );
  }
}

class MyContentBody extends StatefulWidget {
  @override
  _MyContentBodyState createState() => _MyContentBodyState();
}

class _MyContentBodyState extends State<MyContentBody> {
  int _battery = 0;

  /// 核心代码一
  static const platform = MethodChannel(_channelName);
  static const String _channelName = "myApp/battery";
  static const String _methodName = "getBattery";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          child: Text("点击获取电量"),
          onPressed: _getBattery,
        ),
        Text("当前电量：$_battery"),
      ],
    );
  }

  void _getBattery() async {
    /// 核心代码二
    final int result = await platform.invokeMethod(_methodName);
    setState(() {
      _battery = result;
    });
  }
}
