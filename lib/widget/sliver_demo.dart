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
//      appBar: AppBar(
//        title: Text("Sliver Demo"),
//      ),
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

class TestCustomScrollView extends StatelessWidget {
  const TestCustomScrollView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        MySliverAppBar(),
        MySliverList(),
        MySliverGrid(),
      ],
    );
  }
}

/// SliverAppBar
class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true, // SliverAppBar是否跟随CustomScrollView一起滚动
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        title: Text("列表Title"),
        titlePadding: EdgeInsets.only(left: 20),
        background: Image.asset(
          "assets/images/image.jpg",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

/// SliverList
class MySliverList extends StatelessWidget {
  const MySliverList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Container(
            width: 100,
            height: 100,
            color: Color.fromARGB(255, Random().nextInt(256),
                Random().nextInt(256), Random().nextInt(256)),
          );
        },
        childCount: 4,
      ),
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
          childCount: 12,
        ),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ));
  }
}
