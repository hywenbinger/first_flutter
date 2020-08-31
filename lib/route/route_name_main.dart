import 'package:first_flutter/route/route_name_detail.dart';
import 'package:first_flutter/route/route_name_home.dart';
import 'package:flutter/material.dart';

/// 命名路由的用法【启动页】
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RouteNameHomePage.routeName: (context) => RouteNameHomePage(),
        RouteNameDetailPage.routeName: (context) => RouteNameDetailPage(),
      }, // 定义名称和路由之间的映射关系
      initialRoute:
          RouteNameHomePage.routeName, // 默认从哪个路由开始启动，设置此属性后，就不需要设置home属性了
    );
  }
}
