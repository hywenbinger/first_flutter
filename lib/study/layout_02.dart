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
      body: MyContentBody(),
    );
  }
}

class MyContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StackTest();
  }
}

/// Stack
/// 1. 水平和垂直方向上都是内容包裹的
/// 2. StackFit
///     loose：
///     expand：将子元素拉伸到尽可能大
///     passthrough：
/// 3. Overflow：超出部分怎么显示
///     visible：
///     clip：
/// 4. 子元素使用 [Positioned] 定位具体位置
class StackTest extends StatelessWidget {
  const StackTest({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      overflow: Overflow.visible,
      children: <Widget>[
        Image(
          image: AssetImage("assets/images/image.jpg"),
          width: 200,
          height: 200,
        ),
        Positioned(
          top: 10,
          child: Text(
            "Hello World",
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
        Positioned(
          top: 0,
          right: -20,
          child: Icon(
            Icons.star,
            size: 50,
            color: Colors.red,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Color.fromARGB(160, 0, 0, 0),
            padding: EdgeInsets.only(left: 6, right: 6, top: 4, bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "猩球崛起",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Expanded
///     extends Flexible
///     等价于Flexible(fit = FlexFit.tight)
/// 既能控制 [拉伸] 也能控制 [收缩]
/// 使用了Expanded后，宽或高设置的具体数值就无效了，真正的宽高就和 [flex] 参数有关
class ExpandedTest extends StatelessWidget {
  const ExpandedTest({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Container(
//              width: 120,
              height: 100,
              color: Colors.redAccent,
            ),
          ),
          Expanded(
            child: Container(
//              width: 80,
              height: 60,
              color: Colors.cyan,
            ),
          ),
          Container(
            width: 100,
            height: 140,
            color: Colors.deepPurple,
          ),
        ],
      ),
    );
  }
}

/// Column
/// 1. 水平方向内容包裹
/// 2. 垂直方向尽可能占据比较大的空间
class ColumnTest extends StatelessWidget {
  const ColumnTest({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 120,
          height: 100,
          color: Colors.redAccent,
          child: Icon(Icons.android),
        ),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            image:
            DecorationImage(image: AssetImage("assets/images/image.jpg")),
          ),
        ),
        Container(
          width: 60,
          height: 140,
          color: Colors.deepPurple,
        ),
      ],
    );
  }
}

/// Row
/// 1. 水平方向尽可能占据比较大的空间
///     水平方向内容包裹，设置mainAxisSize = MainAxisSize.min，设置后MainAxisAlignment就无效了
/// 2. 垂直方向内容包裹
/// 3. MainAxisAlignment
///     start：在主轴的开始位置，顺序摆放元素，默认
///     center：所有元素在主轴中心点对齐
///     end：在主轴的结束位置，顺序摆放元素
///     spaceBetween：左右两边间距为0，其他元素平分剩余间距
///     spaceAround：左右两边间距是其他元素间距的一半
///     spaceEvenly：所有间距平分空间
/// 4. CrossAxisAlignment
///     start：交叉轴的起始位置对齐
///     end：交叉轴的结束位置对齐
///     center：交叉轴中心对齐，默认
///     stretch：先让Row在垂直方向占据尽可能大的空间，再将所有子元素在垂直方向拉伸到最大
///     baseline：基线对齐，必须设置TextBaseline才生效
/// 5. TextBaseline必须有Text才生效
/// 6. TextDirection，只对Row有效
///     rtl
///     ltr
/// 7. VerticalDirection，只对Column有效
///     up
///     down
class RowTest extends StatelessWidget {
  const RowTest({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 120,
          height: 100,
          color: Colors.redAccent,
          child: Icon(Icons.android),
        ),
        Container(
          width: 80,
          height: 60,
          color: Colors.cyan,
        ),
        Container(
          width: 100,
          height: 140,
          color: Colors.deepPurple,
        ),
      ],
    );
  }
}

/// Flex
/// direction: Axis.vertical 相当于 Column
/// direction: Axis.horizontal 相当于 Row
class FlexTest extends StatelessWidget {
  const FlexTest({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Icon(
          Icons.android,
          color: Colors.blue,
        ),
        Icon(
          Icons.android,
          color: Colors.redAccent,
        ),
      ],
    );
  }
}
