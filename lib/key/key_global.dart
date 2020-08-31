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
  // 创建GlobalKey
  final GlobalKey<_MyContentBodyState> contentBodyKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GlobalKey"),
      ),
      body: MyContentBody(
        key: contentBodyKey, // 关联GlobalKey
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        print(contentBodyKey.currentState.contentBodyStateField);
        contentBodyKey.currentState.contentBodyStateMethod();
        print(contentBodyKey.currentState.widget.contentBodyField);
        contentBodyKey.currentState.widget.contentBodyMethod();
        print(contentBodyKey.currentContext);
      }),
    );
  }
}

class MyContentBody extends StatefulWidget {
  final String contentBodyField = "MyContentBody";

  MyContentBody({Key key}) : super(key: key);

  @override
  _MyContentBodyState createState() => _MyContentBodyState();

  contentBodyMethod() {
    print("contentBodyMethod");
  }
}

class _MyContentBodyState extends State<MyContentBody> {
  final String contentBodyStateField = "_MyContentBodyState";

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  contentBodyStateMethod() {
    print("contentBodyStateMethod");
  }
}
