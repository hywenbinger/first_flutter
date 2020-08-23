import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Key',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> names = ["aaaa", "bbbb", "cccc"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表测试"),
      ),
      body: ListView(
        children: names.map((item) {
          return ListItemFul(
            item,
            key: UniqueKey(),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            names.removeAt(0);
          });
        },
      ),
    );
  }
}

/// 使用 StatelessWidget 测试 key 的用处
class ListItemLess extends StatelessWidget {
  final String name;
  final Color randColor = Color.fromARGB(
    255,
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
  );

  ListItemLess(this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(name),
      height: 80,
      color: randColor,
    );
  }
}

/// 使用 StatefulWidget 测试 key 的用处
class ListItemFul extends StatefulWidget {
  final String name;

  ListItemFul(this.name, {Key key}) : super(key: key);

  @override
  _ListItemFulState createState() => _ListItemFulState();
}

class _ListItemFulState extends State<ListItemFul> {
  final Color randColor = Color.fromARGB(
    255,
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        widget.name,
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
      height: 80,
      color: randColor,
    );
  }
}

