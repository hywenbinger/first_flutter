import 'package:first_flutter/route/route_detail.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// Route
///     * 一个页面要想被路由统一管理，必须包装为一个Route
///     * Route是一个抽象类，所以不能实例化的
///     * 可以使用MaterialPageRoute
/// Navigator
///     * 管理所有的Route的Widget，通过stack结构进行管理
///     * 直接使用 Navigator.of(context) 即可
///     * 常用方法：
///           1.Navigator.of(context).push(route);
///           2.Navigator.of(context).pushNamed(routeName);
///           3.Navigator.of(context).pop();
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatelessWidget {
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
    /// 跳转到详情页
    var future = Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          /// 通过构造函数，往【详情页】传递数据
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
}
