import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomepage2(),
    );
  }
}

/// 第二种滑动监听的方式：使用NotificationListener
///     可以监听开始滚动、滚动中、结束滚动
class MyHomepage2 extends StatefulWidget {
  @override
  _MyHomepage2State createState() => _MyHomepage2State();
}

class _MyHomepage2State extends State<MyHomepage2> {
  final ScrollController _scrollController = ScrollController();
  var _isShowFloatingButton = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滑动监听"),
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification notification) {
          print(
              "总范围: ${notification.metrics.maxScrollExtent}, 当前位置: ${notification.metrics.pixels}");
          if (notification is ScrollStartNotification) {
            print("开始滚动");
            setState(() {
              _isShowFloatingButton = false;
            });
          } else if (notification is ScrollUpdateNotification) {
            print("正在滚动");
          } else if (notification is ScrollEndNotification) {
            print("结束滚动");
            setState(() {
              _isShowFloatingButton = true;
            });
          }
          return true;
        },
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              color: Color.fromARGB(255, Random().nextInt(256),
                  Random().nextInt(256), Random().nextInt(256)),
            );
          },
          itemCount: 21,
          controller: _scrollController,
        ),
      ),
      floatingActionButton: _isShowFloatingButton
          ? FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: Duration(seconds: 1), curve: Curves.easeIn);
              },
              child: Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}

/// 第一种滑动监听的方式：使用ScrollController
///     可以设置默认offset
///     可以监听滚动，也可以监听滚动offset
class MyHomepage1 extends StatefulWidget {
  @override
  _MyHomepage1State createState() => _MyHomepage1State();
}

class _MyHomepage1State extends State<MyHomepage1> {
  final ScrollController _scrollController = ScrollController();
  var _isShowFloatingButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {});
      _isShowFloatingButton = _scrollController.offset >= 500;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滑动监听"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            color: Color.fromARGB(255, Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256)),
          );
        },
        itemCount: 21,
        controller: _scrollController,
      ),
      floatingActionButton: _isShowFloatingButton
          ? FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: Duration(seconds: 2), curve: Curves.easeIn);
              },
              child: Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}
