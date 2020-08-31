import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// 在Flutter中，事件监听有下面几种方式：
///     1.原始指针事件（Pointer Events）
///         * 是人机界面交互的原始数据
///         * 常用以下几个指针事件：
///             1.PointerDownEvent：指针在特定位置与屏幕接触
///             2.PointerMoveEvent：指针从屏幕的一个位置移动到另外一个位置
///             3.PointerUpEvent：指针与屏幕停止接触
///             4.PointerCancelEvent：指针因为一些特殊情况被取消
///         * 在指针落下时，框架做了一个 hit test 的操作，确定与屏幕发生接触的位置上有哪些Widget以及分发给最内部的组件去响应
///         * 事件会沿着最内部的组件向组件树的根冒泡分发
///         * 不存在用于取消或者停止指针事件进一步分发的机制
///     2.手势识别（Gesture Detector）
///         * 是对原始数据的封装
///         * 常用手势分以下几个种类：
///             1.点击
///                 onTapDown：用户发生手指按下的操作
///                 onTapUp：用户发生手指抬起的操作
///                 onTap：用户点击事件完成
///                 onTapCancel：事件按下过程中被取消
///             2.双击
///                 onDoubleTap：快速点击了两次
///             3.长按
///                 onLongPress：在屏幕上保持了一段时间
///             4.纵向拖拽
///                 onVerticalDragStart：指针和屏幕产生接触并可能开始纵向移动
///                 onVerticalDragUpdate：指针和屏幕产生接触，在纵向上发生移动并保持移动
///                 onVerticalDragEnd：指针和屏幕产生接触结束
///             5.横向拖拽
///                 onHorizontalDragStart：指针和屏幕产生接触并可能开始横向移动
///                 onHorizontalDragUpdate：指针和屏幕产生接触，在横向上发生移动并保持移动
///                 onHorizontalDragEnd：指针和屏幕产生接触结束
///             6.移动
///                 onPanStart：指针和屏幕产生接触并可能开始横向移动或者纵向移动
///                     如果设置了 onHorizontalDragStart 或者 onVerticalDragStart，该回调方法会引发崩溃
///                 onPanUpdate：指针和屏幕产生接触，在横向或者纵向上发生移动并保持移动
///                     如果设置了 onHorizontalDragUpdate 或者 onVerticalDragUpdate，该回调方法会引发崩溃
///                 onPanEnd：指针先前和屏幕产生了接触，并且以特定速度移动，此后不再在屏幕接触上发生移动
///                     如果设置了 onHorizontalDragEnd 或者 onVerticalDragEnd，该回调方法会引发崩溃
///     3.使用Widget中自带的事件监听
///         比如：RaisedButton、FlatButton、InkWell等
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
        title: Text("事件监听"),
      ),
      body: MyContentBody(),
    );
  }
}

class MyContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EventIncidentTest();
  }
}

/// Pointer指针事件
class PointerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Listener(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.redAccent,
        ),
        onPointerDown: (event) =>
            print("手指按下:$event, ${event.position}, ${event.localPosition}"),
        onPointerMove: (event) =>
            print("手指移动:$event, ${event.position}, ${event.localPosition}"),
        onPointerUp: (event) =>
            print("手指抬起:$event, ${event.position}, ${event.localPosition}"),
      ),
    );
  }
}

/// GestureDetector手势识别
class GestureDetectorTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.redAccent,
      ),
      onTap: () => print("onTap"),
      onTapDown: (details) => print(
          "onTapDown-->${details.localPosition}, ${details.globalPosition}"),
      onTapUp: (details) => print(
          "onTapUp-->${details.localPosition}, ${details.globalPosition}"),
    );
  }
}

/// 事件冲突验证
///     * 父子关系的Widget，无法避免事件传递出现的冲突
///     * 要想解决事件冲突，只能避免事件监听的Widget没有父子关系
///     * IgnorePointer嵌套的Widget，不会接收到手势事件
class EventIncidentTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GestureDetector(
            child: Container(
              width: 200,
              height: 200,
              color: Colors.redAccent,
            ),
            onTap: () => print("outer click"),
          ),
          GestureDetector(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
            onTap: () => print("inner click"),
          ),
        ],
      ),
    );
  }
}
