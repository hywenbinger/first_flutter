import 'package:flutter/material.dart';

class RouteDetailPage extends StatelessWidget {
  final String _message;

  RouteDetailPage(this._message);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      /// onWillPop()返回值：
      ///     1.返回Future.value(false)：自行处理返回逻辑
      ///     2.返回Future.value(true)：自动返回(Flutter内部实现)
      onWillPop: () {
        print("返回了");
        _jumpToHomePage(context, "返回退到主页");
        return Future.value(false);
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("路由——详情页"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _getText(context),
                _getButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getText(BuildContext context) {
    return Text(
      _message,
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
      ),
    );
  }

  Widget _getButton(BuildContext context) {
    return FlatButton(
      color: Colors.grey,
      onPressed: () {
        print("点击退到主页");
        _jumpToHomePage(context, "点击退到主页");
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.redAccent,
      ),
    );
  }

  /// 注意：这里传入的BuildContext必须是page root的BuildContext
  ///      否则pop后会出现黑屏问题
  /// pop()中携带了传递给【主页】的数据
  void _jumpToHomePage(BuildContext context, String message) {
    Navigator.of(context).pop(message);
  }
}
