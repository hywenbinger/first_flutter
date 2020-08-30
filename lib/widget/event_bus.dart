import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// event_bus可以很方便的 跨组件传递事件
///     第一步：创建一个全局的EventBus对象
///     第二步：发出事件
///     第三步：接收事件
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomepage(),
    );
  }
}

/// 第一步：创建一个全局的EventBus对象
final eventBus = EventBus();

class MyHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("event_bus"),
      ),
      body: MyContentBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// 第二步：发出事件
          eventBus.fire("event_bus发来的事件");
        },
        child: Icon(
          Icons.airport_shuttle,
        ),
      ),
    );
  }
}

class MyContentBody extends StatefulWidget {
  @override
  _MyContentBodyState createState() => _MyContentBodyState();
}

class _MyContentBodyState extends State<MyContentBody> {
  String message = "";

  @override
  void initState() {
    super.initState();

    /// 第三步：监听接收事件
    eventBus.on<String>().listen((data) {
      print(data);
      setState(() {
        message = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
