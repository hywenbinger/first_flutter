import 'package:flutter/material.dart';

/// 主题
///
/// 主题的作用：
///     1.设置主题后，某些Widget会自动使用主题的样式
///     2.将某些样式放到主题中统一管理，应用程序其他地方可直接引用
///
void main() => runApp(MyApp());

/// 全局Theme
///     1.全局Theme会影响整个App的颜色和Widget样式
///     2.向 MaterialApp 构造器传入【ThemeData】即可
///     3.如果没有设置Theme，Flutter将会使用预设的样式
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Wayne Flutter", //最近使用中显示
      theme: ThemeData(
        // 1.亮度
        brightness: Brightness.light,
        // 2.primarySwatch: primaryColor/accentColor的结合体
        primarySwatch: Colors.yellow,
        // 3.主要颜色: 导航/底部TabBar
        primaryColor: Colors.deepPurple,
        // 4.次要颜色: FloatingActionButton/按钮颜色
        accentColor: Colors.redAccent,
        // 5.按钮主题
        buttonTheme: ButtonThemeData(
          height: 100,
          minWidth: 100,
        ),
        // 6.卡片主题
        cardTheme: CardTheme(
          color: Colors.greenAccent,
          elevation: 10,
          margin: EdgeInsets.all(10),
        ),
        // 7.文本主题
        textTheme: TextTheme(
          // 默认的文本样式
          bodyText2: TextStyle(
            fontSize: 30,
          ),
          headline1: TextStyle(
            fontSize: 38,
            color: Colors.lightGreen,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("全局主题"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "学习Flutter全局主题",
            ),
            Text(
              "学习Flutter全局主题",
              style: Theme.of(context).textTheme.headline1,
            ),
            Switch(
              value: true,
              onChanged: (value) {},
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("RaiseButton"),
            ),
            Card(
              child: Text(
                "Card",
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("首页"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("收藏"),
          ),
        ],
      ),
    );
  }
}

