import 'package:flutter/material.dart';

/// 动画
///
/// Animation：抽象类
///     1.监听动画状态改变
///     2.获取动画status
///     3.获取动画value
/// AnimationController
///     1.继承了Animation的所有功能
///     2.vsync：必传参数(this -> with SingleTickerProviderStateMixin)，同步信号
///     3.forward()：向前执行
///     4.reverse()：动画反转
/// CurvedAnimation
///     1.设置动画执行的加速器
///     2.parent：必传参数(传入AnimationController)
///     3.curve：必传参数(传入Curves对应定义好的数值)
/// Tween
///     1.设置动画执行的线性插值
///     2.begin：动画开始的插值
///     3.end：动画结束的插值
///     4.animate()：通过此方法和AnimationController、CurvedAnimation建立关联
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

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<_MyHeartState> _globalKey = GlobalKey();
  IconData _icon = Icons.play_arrow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画"),
      ),
      body: MyHeart(
        key: _globalKey,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _icon,
        ),
        onPressed: () {
          if (_globalKey.currentState._controller.isAnimating) {
            // 如果正在执行动画，点击停止
            _globalKey.currentState._controller.stop();
            _icon = Icons.play_arrow;
          } else if (_globalKey.currentState._controller.isDismissed) {
            // 如果动画停在开始阶段，点击向前执行
            _globalKey.currentState._controller.forward();
            _icon = Icons.stop;
          } else {
            if (_globalKey.currentState._controller.status ==
                AnimationStatus.forward) {
              _globalKey.currentState._controller.forward();
            } else if (_globalKey.currentState._controller.status ==
                AnimationStatus.reverse) {
              _globalKey.currentState._controller.reverse();
            }
            _icon = Icons.stop;
          }
          setState(() {});
        },
      ),
    );
  }
}

/// 心跳动画
/// 改变Widget的大小即可
class MyHeart extends StatefulWidget {
  MyHeart({Key key}) : super(key: key);

  @override
  _MyHeartState createState() => _MyHeartState();
}

class _MyHeartState extends State<MyHeart> with SingleTickerProviderStateMixin {
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
    _controller.addListener(() {
      setState(() {});
    });

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
    return Center(
      child: Icon(
        Icons.favorite,
        color: Colors.red,
        size: _tween.value,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    /// 第六步：释放动画
    _controller.dispose();
  }
}
