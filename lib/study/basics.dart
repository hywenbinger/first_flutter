import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// Widget:
///   StatefulWidget: 有状态的Widget
///   StatelessWidget: 无状态的Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Flutter App"),
      ),
      body: MyContentBody2(),
    );
  }
}

class MyContentBody1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Hello Flutter",
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 38, color: Colors.blue),
      ),
    );
  }
}

class MyContentBody2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyContentBody2State();
  }
}

class MyContentBody2State extends State<MyContentBody2> {
  /// check box的状态
  var _flag = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              value: _flag,
              onChanged: (value) {
                print(value);
                setState(() {
                  _flag = value;
                });
              }),
          Text(
            "同意协议",
            style: TextStyle(
                fontSize: 20, color: Colors.blue, fontStyle: FontStyle.italic),
          )
        ],
      ),
    );
  }
}
