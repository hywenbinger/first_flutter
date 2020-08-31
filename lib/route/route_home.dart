import 'package:first_flutter/route/route_detail.dart';
import 'package:flutter/material.dart';

/// 路由的基础用法【主页】
class RouteHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由——主页"),
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
          _getButton2(context),
          _getButton3(context),
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
        print("点击跳到详情页");
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
    var future = Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          /// 通过【构造函数】，往【详情页】传递数据
          return RouteDetailPage("主页传来的数据");
        },
      ),
    );

    /// 接收【详情页】返回传递过来的数据
    future.then((value) {
      setState(() {
        _message = value;
      });
    });
  }

  Widget _getButton2(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _jumpToDetailPage2(context);
      },
      child: Text(
        "使用命名路由方式跳到详情页",
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  void _jumpToDetailPage2(BuildContext context) {
    /// 使用命名路由方式跳转到【详情页】
    Navigator.of(context)
        .pushNamed(RouteDetailPage.routeName, arguments: "从主页使用命名路由方式跳转并传递的数据");
  }

  Widget _getButton3(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _jumpToUnknownPage(context);
      },
      child: Text(
        "点击跳到未知页面",
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  void _jumpToUnknownPage(BuildContext context) {
    /// 使用命名路由方式启动不存在的路由
    Navigator.of(context).pushNamed("unknown");
  }
}
