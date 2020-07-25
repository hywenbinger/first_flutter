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
        title: Text("ListView"),
      ),
      body: MyContentBody(),
    );
  }
}

class MyContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TestListView();
  }
}

/// ListView
///     1.ListView()
///     2.ListView.builder()
///     3.ListView.separated()
///     4.ListView.custom()
class TestListView extends StatelessWidget {
  const TestListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.custom(childrenDelegate: null);
  }
}

/// 使用ListView.separated()方式创建ListView
/// The ListView.separated constructor takes two IndexedWidgetBuilders: itemBuilder builds child items on demand,
/// and separatorBuilder similarly builds separator children which appear in between the child items.
/// This constructor is appropriate for list views with a fixed number of children.
class ListViewSeparated extends StatelessWidget {
  const ListViewSeparated({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Text("data $index");
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.blue,
          height: 50,
          // 两个分割线之间的高度
          thickness: 2,
          indent: 10,
          endIndent: 50,
        );
      },
      itemCount: 21,
    );
  }
}

/// 使用ListView.builder()方式创建ListView
/// The ListView.builder constructor takes an IndexedWidgetBuilder, which builds the children on demand.
/// This constructor is appropriate for list views with a large (or infinite) number of children
/// because the builder is called only for those children that are actually visible.
class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Text("data $index");
      },
      itemCount: 20,
      itemExtent: 100,
    );
  }
}

/// 使用默认构造函数创建ListView
/// The default constructor takes an explicit List<Widget> of children.
/// This constructor is appropriate for list views with a small number of children
/// because constructing the List requires doing work for every child that could
/// possibly be displayed in the list view instead of just those children that are actually visible.
class ListViewConstructor extends StatelessWidget {
  const ListViewConstructor({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      itemExtent: 100, // 设置Item的高度
      children: List.generate(100, (index) {
        // ListTile是Flutter提供的List Item的样式
        return ListTile(
          leading: Icon(Icons.android),
          trailing: Icon(Icons.delete),
          title: Text("联系人 ${index + 1}"),
          subtitle: Text("电话号码：${index.toString() * 4}"),
          onTap: () {
            print("tap item $index");
          },
          onLongPress: () {
            print("long press item $index");
          },
        );
      }),
    );
  }
}
