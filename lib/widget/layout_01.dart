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
        title: Text("布局Widget"),
      ),
      body: MyStatefulContentBody(),
    );
  }
}

class MyStatefulContentBody extends StatefulWidget {
  @override
  _MyStatefulContentBodyState createState() {
    return _MyStatefulContentBodyState();
  }
}

class _MyStatefulContentBodyState extends State<MyStatefulContentBody> {
  @override
  Widget build(BuildContext context) {
    return ContainerTest();
  }
}

/// Container
/// 1.内容包裹
/// 2.固定大小
/// 3.填充父布局
/// 4.默认Alignment是(0,0)居中的
class ContainerTest extends StatelessWidget {
  const ContainerTest({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      alignment: Alignment.topRight,
//      color: Colors.red,
      /// color 和 decoration不能共同存在
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(
          color: Colors.yellowAccent,
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple,
            offset: Offset(7, 7),
            blurRadius: 2,
          ),
          BoxShadow(
            color: Colors.cyan,
            offset: Offset(-7, -7),
            blurRadius: 2,
          ),
        ],
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
//      transform: Matrix4.rotationZ(50),
      child: Icon(
        Icons.star,
        size: 50,
        color: Colors.yellow,
      ),
    );
  }
}

/// Padding
class PaddingTest extends StatelessWidget {
  const PaddingTest({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10, left: 10),
          child: Text(
            "你好呀",
            style: TextStyle(
              fontSize: 24,
              backgroundColor: Colors.blue,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, left: 50),
          child: Text(
            "我很好",
            style: TextStyle(
              fontSize: 24,
              backgroundColor: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}

/// Align
class AlignTest extends StatelessWidget {
  const AlignTest({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.grey,
      child: Align(
        alignment: Alignment(0.5, 0.5), // 左上角(-1,-1) 右下角(1,1)
        child: Icon(
          Icons.android,
          size: 50,
          color: Colors.blue,
        ),
      ),
    );
  }
}
