import 'dart:math';

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
        title: Text("Sliver"),
      ),
      body: MyContentBody(),
    );
  }
}

class MyContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TestCustomScrollView();
  }
}

/// CustomScrollView
///
/// SafeArea包裹的Widget，只会在安全区(除了留海、圆角底边等的区域)内显示
/// SliverSafeArea包裹的Sliver，默认在安全区内显示，但是滚动时会滚动到安全区外
///
/// Padding包裹的Widget，滚动不到内边距区域内
/// SliverPadding包裹的Sliver，可以滚动到内边距区域内
class TestCustomScrollView extends StatelessWidget {
  const TestCustomScrollView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        MySliverGrid(),
      ],
    );
  }
}

/// SliverGrid
class MySliverGrid extends StatelessWidget {
  const MySliverGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            return Container(
              color: Color.fromARGB(255, Random().nextInt(256),
                  Random().nextInt(256), Random().nextInt(256)),
            );
          },
          childCount: 21,
        ),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ));
  }
}
