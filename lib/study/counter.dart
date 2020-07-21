import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
        title: Text("计数器"),
      ),
      body: MyContentBody(),
    );
  }
}

class MyContentBody extends StatefulWidget {
  final String msg = "This is page body";

  @override
  _MyContentBodyState createState() => _MyContentBodyState();
}

class _MyContentBodyState extends State<MyContentBody> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    ///通过 [widget] 属性可以获取Stated对应的StatefulWidget实例
    print(widget.msg);
    return Center(
      child: Column(
        ///Column match parent height, so need set [MainAxisAlignment.center] to center.
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _getButtons(),
          Text(
            "当前计数：$_counter",
            style: TextStyle(fontSize: 26),
          ),
        ],
      ),
    );
  }

  Widget _getButtons() {
    return Row(
      ///Row match parent width, so need set [MainAxisAlignment.center] to center.
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _getButton("+1", true),
        _getButton("-1", false),
      ],
    );
  }

  RaisedButton _getButton(String content, bool isAdd) {
    return RaisedButton(
        child: Text(
          content,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
          ),
        ),
        color: isAdd ? Colors.pinkAccent : Colors.yellowAccent,
        onPressed: () {
          setState(() {
            if (isAdd) {
              _counter++;
            } else {
              _counter--;
            }
          });
        });
  }
}
