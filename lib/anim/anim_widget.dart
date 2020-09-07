import 'package:flutter/material.dart';

/// 使用Animation基础功能实现动画，存在两个问题：
///     1.代码较多，代码冗余，每次写动画都要监听状态，然后调用setState通知Widget更新
///     2.调用setState更新Widget时，State类中的build方法就会被重新build(牵一发而动全身)，效率较低
///
/// 使用【AnimatedWidget】可以结局Animation基础用法带来的问题
///     * 将需要执行动画的Widget，放到AnimatedWidget中，并通过build方法返回
///     * 但是AnimatedWidget也存在两个问题：
///         1.每次都要写个类，较麻烦
///         2.如果构建的Widget有子类，那么子类还是会被重新build
///
/// 使用【AnimatedBuilder】可以解决AnimatedWidget带来的问题
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
  Animation _tween;

  @override
  void initState() {
    super.initState();

    /// 第一步：创建AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );

    /// 第二步：设置加速器
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );

    /// 第三步：设置开始结束的插值
    _tween = Tween(begin: 60.0, end: 100.0).animate(_animation);

    /// 第四步：监听动画插值的变化，刷新Widget
//    _controller.addListener(() {
//      setState(() {});
//    });

    /// 第五步：监听动画状态的变化
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
    print("build方法执行了");
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedWidget 和 AnimatedBuilder"),
      ),
      body: Center(
//        child: TestAnimatedWidget(_tween),
        child: _testAnimatedBuilder(),
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

  /// 测试AnimatedBuilder
  Widget _testAnimatedBuilder() {
    return AnimatedBuilder(
      animation: _tween,
      builder: (context, widget) {
        return Icon(
          Icons.favorite,
          color: Colors.red,
          size: _tween.value,
        );
      },
    );
  }
}

/// 测试AnimatedWidget
class TestAnimatedWidget extends AnimatedWidget {
  TestAnimatedWidget(Animation animation) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation animation = listenable;
    return Icon(
      Icons.favorite,
      color: Colors.red,
      size: animation.value,
    );
  }
}
