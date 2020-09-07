import 'dart:math';

import 'package:flutter/material.dart';

/// 交织动画
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  Animation<double> _tweenSize;
  Animation<Color> _tweenColor;
  Animation<double> _tweenOpacity;
  Animation<double> _tweenRadian;

  @override
  void initState() {
    super.initState();

    /// 创建AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 2,
      ),
    );

    /// 设置加速器
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );

    /// 设置插值
    _tweenSize = Tween(begin: 50.0, end: 200.0).animate(_animation);
    _tweenColor =
        ColorTween(begin: Colors.red, end: Colors.blue).animate(_animation);
    _tweenOpacity = Tween(begin: 1.0, end: 0.1).animate(_animation);
    _tweenRadian = Tween(begin: 0.0, end: pi * 2).animate(_animation);

    /// 监听动画状态的变化
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Staggered Animation"),
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, widget) {
          return _getWidget();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.play_arrow,
        ),
        onPressed: () {
          _controller.forward();
        },
      ),
    );
  }

  /// 1.大小
  /// 2.颜色
  /// 3.透明度
  /// 4.旋转
  Widget _getWidget() {
    return Center(
      child: Opacity(
        opacity: _tweenOpacity.value,
        child: Transform(
          transform: Matrix4.rotationZ(_tweenRadian.value),
          alignment: Alignment.center,
          child: Container(
            width: _tweenSize.value,
            height: _tweenSize.value,
            color: _tweenColor.value,
          ),
        ),
      ),
    );
  }
}
