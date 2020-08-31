import 'package:flutter/material.dart';

/// 命名路由的用法【详情页】
class RouteNameDetailPage extends StatelessWidget {
  static const String routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    /// 获取【主页】传递过来的数据
    final String message = ModalRoute.of(context).settings.arguments as String;
    return WillPopScope(
      onWillPop: () {
        _jumpToHomePage(context, "返回退到主页");
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("命名路由——详情页"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _getText(context, message),
              _getButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getText(BuildContext context, String message) {
    return Text(
      message,
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
        _jumpToHomePage(context, "点击退到主页");
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.redAccent,
      ),
    );
  }

  void _jumpToHomePage(BuildContext context, String message) {
    /// pop()中携带了传递给【主页】的数据
    Navigator.of(context).pop(message);
  }
}
