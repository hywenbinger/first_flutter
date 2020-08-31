import 'package:first_flutter/route/route_detail.dart';
import 'package:first_flutter/route/route_home.dart';
import 'package:first_flutter/route/route_unknown.dart';
import 'package:flutter/material.dart';

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

/// 路由的基础用法【启动页】
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RouteHomePage(),

      /// 钩子函数：onGenerateRoute
      ///     * 当我们通过pushNamed进行跳转，但是对应的name没有在routes中有映射关系，就会执行onGenerateRoute函数
      ///     * 可以在该函数中，手动创建对应的Route进行返回
      ///     * 该函数有一个参数RouteSettings，该类有两个常用的属性：
      ///         1.name: 跳转的路由名称
      ///         2.arguments：跳转时携带的参数
      onGenerateRoute: (settings) {
        print("onGenerateRoute");
        if (settings.name == RouteDetailPage.routeName) {
          return MaterialPageRoute(
            builder: (context) {
              return RouteDetailPage(settings.arguments);
            },
          );
        }
        return null;
      },

      /// 未知路由函数：onUnknownRoute
      ///     * 打开的一个路由名称不存在的界面，并且onGenerateRoute函数中未处理返回null，就会执行onUnknownRoute函数
      ///     * 如果没有进行特殊的处理，那么Flutter会报错
      onUnknownRoute: (settings) {
        print("onUnknownRoute");
        return MaterialPageRoute(builder: (context) {
          return RouteUnknownPage();
        });
      },
    );
  }
}
