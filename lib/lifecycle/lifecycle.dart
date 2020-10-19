import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("生命周期"),
      ),
      body: TestStatefulWidget(),
    );
  }
}

/// 测试【StatelessWidget】的生命周期
class TestStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "StatelessWidget",
      style: TextStyle(
        fontSize: 30,
      ),
    );
  }
}

/// 测试【StatefulWidget】的生命周期
class TestStatefulWidget extends StatefulWidget {
  @override
  _TestStatefulWidgetState createState() => _TestStatefulWidgetState();
}

class _TestStatefulWidgetState extends State<TestStatefulWidget>
    with WidgetsBindingObserver {
  /// Widget创建执行的第一个方法
  /// 可以在里面初始化一些数据
  @override
  void initState() {
    super.initState();
    print("initState");
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("didChangeAppLifecycleState-->$state");
  }

  /// 当State对象的依赖发生变化时会被调用
  /// 例如：在之前build()中包含了一个InheritedWidget，然后在之后的build()中InheritedWidget发生了变化，
  ///      那么此时InheritedWidget的子widget的didChangeDependencies()回调都会被调用。
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  /// 当树rebuild的时候会调用该方法
  @override
  void didUpdateWidget(TestStatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Text(
      "StatefulWidget",
      style: TextStyle(
        fontSize: 30,
      ),
    );
  }

  /// 此回调是专门为了开发调试而提供的，
  /// 在热重载(hot reload)时会被调用，
  /// 此回调在Release模式下永远不会被调用
  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  /// 当State对象从树中被移除时，会调用此回调
  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  /// 当State对象从树中被永久移除时调用
  /// 通常在此回调中释放资源
  @override
  void dispose() {
    super.dispose();
    print("dispose");
    WidgetsBinding.instance.removeObserver(this);
  }
}
