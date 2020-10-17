import 'package:flutter/material.dart';

/// 暗黑主题适配
///     通过 darkTheme 字段设置暗黑主题
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: AppTheme._lightTheme,
      darkTheme: AppTheme._darkTheme,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("暗黑主题"),
      ),
      body: Center(
        child: Text("主要内容"),
      ),
    );
  }
}

class AppTheme {
  // 1.相同的样式
  static const double _fontSize = 20;

  // 2.亮色主题
  static final ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.pink,
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.red,
        fontSize: _fontSize,
      ),
    ),
  );

  // 2.暗色主题
  static final ThemeData _darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.white,
        fontSize: _fontSize,
      ),
    ),
  );
}
