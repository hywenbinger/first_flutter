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
        title: Text("GridView"),
      ),
      body: MyContentBody(),
    );
  }
}

class MyContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TestGridView();
  }
}

/// GridView
///     GridView()
///     GridView.count()
///     GridView.extent()
///     GridView.builder()
class TestGridView extends StatelessWidget {
  const TestGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridViewBuilder();
  }
}

/// 使用GridView.builder()方式创建GridView
class GridViewBuilder extends StatelessWidget {
  const GridViewBuilder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.5,
        ),
        itemBuilder: (context, index) {
          return Container(
            color: Color.fromARGB(255, Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256)),
          );
        });
  }
}

/// 使用GridView.extent()方式创建GridView
/// 相当于使用 [构造函数方法、gridDelegate = SliverGridDelegateWithMaxCrossAxisExtent] 的方式创建GridView
class GridViewExtent extends StatelessWidget {
  const GridViewExtent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 200,
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(256),
              Random().nextInt(256), Random().nextInt(256)),
        );
      }),
    );
  }
}

/// 使用GridView.count()方式创建GridView
/// 相当于使用 [构造函数方法、gridDelegate = SliverGridDelegateWithFixedCrossAxisCount] 的方式创建GridView
class GridViewCount extends StatelessWidget {
  const GridViewCount({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(256),
              Random().nextInt(256), Random().nextInt(256)),
        );
      }),
    );
  }
}

/// 使用默认构造函数创建GridView
class GridViewConstructorExtent extends StatelessWidget {
  const GridViewConstructorExtent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // 注意：这里是max extent，是Item最大的宽度
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2, // Item交叉轴和主轴的比率，可通过这个参数设置Item高度
      ),
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(256),
              Random().nextInt(256), Random().nextInt(256)),
        );
      }),
    );
  }
}

/// 使用默认构造函数创建GridView
class GridViewConstructorCount extends StatelessWidget {
  const GridViewConstructorCount({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(256),
              Random().nextInt(256), Random().nextInt(256)),
        );
      }),
    );
  }
}
