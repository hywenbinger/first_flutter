import 'package:flutter/material.dart';

void main() => runApp(MyApp());

///  1.短时状态 Ephemeral State
///     这种状态只需要使用StatefulWidget对应的State类自己管理即可。
///
///  2.应用状态 App State
///     这种状态如果在Widget之间传递，那么代码的耦合度会变得非常高，无论是代码编写质量、后期维护、可扩展性都非常差。
///     所以要选择全局状态管理的方式，来对应用状态进行统一的管理和应用。
///
///  3.如何选择不同的管理方式？
///     官方建议：Single Widget -- Ephemeral State
///              Some Widgets -- App State
///     Redux作者建议：选择能够减少麻烦的方式
///
///  4.共享状态管理
///     InheritedWidget
///     Provider
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomepage(),
    );
  }
}

/// InheritedWidget测试
class DataWidget extends InheritedWidget {
  final int num;

  DataWidget({this.num, Widget child}) : super(child: child);

  static DataWidget of(BuildContext context) {
    /// dependOnInheritedWidgetOfExactType()方法的作用就是：
    ///     沿着Element Tree，找到最近的DataElement，然后从Element中取出Widget
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(DataWidget oldWidget) {
    /// 注意这个方法的返回值
    /// 返回true，会回调依赖当前InheritedWidget的State中的didChangeDependencies()
    return this.num != oldWidget.num;
  }
}

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  int _num = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("使用InheritedWidget管理State"),
      ),
      body: DataWidget(
        num: _num,
        // Column外面包裹DataWidget
        child: Column(
          children: <Widget>[
            InheritedTest01(),
            InheritedTest02(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _num++;
            print("onPressed-->$_num");
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class InheritedTest01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// BuildContext实际就是Element
    /// 调用下面方法后，会沿着Element Tree，向上一直找到合适的DataWidget
    /// 然后就可以访问DataWidget中的变量了
    final int num = DataWidget.of(context).num;

    return Container(
      color: Colors.blue,
      child: Text(
        "Container当前数值：$num",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }
}

class InheritedTest02 extends StatefulWidget {
  @override
  _InheritedTest02State createState() => _InheritedTest02State();
}

class _InheritedTest02State extends State<InheritedTest02> {
  /// 依赖的[State]对象变化时被调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("执行了_InheritedTest02State的didChangeDependencies()");
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.redAccent,
      child: Text(
        "Card当前数值：${DataWidget.of(context).num}",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }
}
