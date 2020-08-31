import 'package:first_flutter/route/route_name_detail.dart';
import 'package:flutter/material.dart';

/// 命名路由的用法【主页】
class RouteNameHomePage extends StatelessWidget {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("命名路由——主页"),
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
  String _message = "";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _getText(context),
          _getButton(context),
        ],
      ),
    );
  }

  Widget _getText(BuildContext context) {
    return Text(
      _message,
      style: TextStyle(
        fontSize: 30,
        color: Colors.black38,
      ),
    );
  }

  Widget _getButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _jumpToDetailPage(context);
      },
      child: Text(
        "点击跳转到详情页",
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  void _jumpToDetailPage(BuildContext context) {
    /// 跳转到【详情页】
    /// 通过【arguments参数】，往【详情页】传递数据
    var future = Navigator.of(context)
        .pushNamed(RouteNameDetailPage.routeName, arguments: "主页传来的数据");

    /// 接收【详情页】返回传递过来的数据
    future.then((value) {
      setState(() {
        _message = value;
      });
    });
  }
}
