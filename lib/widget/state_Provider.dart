import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 使用步骤：
///     第一步：创建要共享的数据
///     第二步：为顶层Widget包裹ChangeNotifierProvider
///         1.使用 MultiProvider
///             当需要共享的数据不止一个时，一个Provider必然是不够的
///             使用MultiProvider可以赖的多个ChangeNotifierProvider
///     第三步：在其他Widget中使用共享数据
///         1.使用 Provider.of
///             使用简洁
///             当数据变化时，Provider.of所在的Widget会被重新build
///             build成本较高，开发时不建议使用
///         2.使用 Consumer(Consumer2、Consumer3、Consumer4、Consumer5、Consumer6)
///             使用相对Provider.of复杂些
///             当数据变化时，只会执行Consumer的builder()方法
///             build成本较低，开发时建议使用
///         3.使用 Selector(Selector0、Selector2、Selector3、Selector4、Selector5、Selector6)
///             使用相对Consumer复杂些
///             使用起来更灵活，可以进行数据转换，也可以控制Widget是否重新build
///             在某些情况下，使用Selector来代替Consumer，性能会更高
void main() {
  runApp(
    /// 第二步：为顶层Widget包裹ChangeNotifierProvider
//    ChangeNotifierProvider(
//      create: (context) => DataViewModel(),
//      child: MyApp(),
//    ),
    /// 第二步：使用MultiProvider处理依赖的多个ChangeNotifierProvider
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserViewModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

/// 第一步：创建自己的ChangeNotifier，用来保存共享的状态
class DataViewModel extends ChangeNotifier {
  int _counter = 200;

  int get counter => _counter;

  set counter(int value) {
    _counter = value;
    // 通知所有的Consumer进行更新
    notifyListeners();
  }
}

/// 第一步：另一个需要共享的状态
class UserViewModel extends ChangeNotifier {
  int _age = 200;

  int get age => _age;

  set age(int value) {
    _age = value;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("使用Provider管理State"),
      ),
      body: MyContentBody(),
      floatingActionButton: _getFloatingActionButton02(),
    );
  }

  /// 第三步：通过 Consumer 使用共享数据
  Widget _getFloatingActionButton01() {
    return Consumer<DataViewModel>(
      builder: (context, value, child) {
        print("_getFloatingActionButton01的Consumer的builder()");
        return FloatingActionButton(
          onPressed: () {
            print("add button press");
            value.counter += 1;
          },
          child: child, // 可以避免数据变化时，不必要的构建
        );
      },
      child: Icon(
        Icons.add, // 此处的child会被赋值到builder(context, value, child)的child参数里
      ),
    );
  }

  /// 第三步：通过 Selector 使用共享数据
  /// 关键点：
  ///     1.两个泛型参数(原始数据类型，转换后的数据类型)
  ///     2.selector回调函数，转换函数(如何把原始数据转换成新数据，返回转换后的数据)
  ///     3.shouldRebuild回调函数，两个参数分别是转换前后的数据；无论数据如何变化，都不希望rebuild，可以直接返回false
  Widget _getFloatingActionButton02() {
    return Selector<DataViewModel, DataViewModel>(
      selector: (context, value) => value,
      shouldRebuild: (previous, next) => false,
      builder: (context, value, child) {
        print("_getFloatingActionButton02的Consumer的builder()");
        return FloatingActionButton(
          onPressed: () {
            print("add button press");
            value.counter += 1;
          },
          child: child, // 可以避免数据变化时，不必要的构建
        );
      },
      child: Icon(
        Icons.add, // 此处的child会被赋值到builder(context, value, child)的child参数里
      ),
    );
  }
}

class MyContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProviderTest01(),
        ProviderTest02(),
      ],
    );
  }
}

class ProviderTest01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("ProviderTest01的build()");

    /// 第三步：通过 Consumer 使用共享数据
    Widget widget = Consumer<DataViewModel>(
      builder: (context, value, child) {
        print("ProviderTest01的Consumer的builder()");
        return Text(
          "Container当前数值：${value.counter}",
          style: TextStyle(
            fontSize: 24,
          ),
        );
      },
    );
    return Container(
      color: Colors.redAccent,
      child: widget,
    );
  }
}

class ProviderTest02 extends StatefulWidget {
  @override
  _ProviderTest02State createState() => _ProviderTest02State();
}

class _ProviderTest02State extends State<ProviderTest02> {
  @override
  void initState() {
    super.initState();
    print("执行了_ProviderTest02State的initState()");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("执行了_ProviderTest02State的didChangeDependencies()");
  }

  @override
  Widget build(BuildContext context) {
    print("ProviderTest02的build()");

    /// 第三步：通过 Provider 使用共享数据
    final int counter = Provider.of<DataViewModel>(context).counter;
    return Card(
      color: Colors.blue,
      child: Text(
        "Card当前数值：$counter",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }
}
