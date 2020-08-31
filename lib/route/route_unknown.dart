import 'package:flutter/material.dart';

/// 路由的基础用法【未知页面】
class RouteUnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("路由——未知页面"),
      ),
      body: Container(
        child: Center(
          child: Text(
            "页面跳转错误",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
