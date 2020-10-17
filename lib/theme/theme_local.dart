import 'package:flutter/material.dart';

/// 主题
///
/// 主题的作用：
///     1.设置主题后，某些Widget会自动使用主题的样式
///     2.将某些样式放到主题中统一管理，应用程序其他地方可直接引用
///
void main() => runApp(MyApp());

/// 局部主题
///     1.在Widget的父节点包裹一下Theme即可
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.redAccent,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.yellow,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("局部主题"),
        ),
        body: Text("学习Flutter局部主题"),
        floatingActionButton: Theme(
          data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    secondary: Colors.deepPurple,
                  ),),
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Icons.add,
            ),
          ),
        ),
      ),
    );
  }
}
