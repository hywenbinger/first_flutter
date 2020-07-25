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
        title: Text("商品列表"),
      ),
      body: MyContentBody(),
    );
  }
}

class MyContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MyListItem("Title1", "Content1",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        MyListItem("Title2", "Content2",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
        MyListItem("Title3", "Content3",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
        MyListItem("Title4", "Content4",
            "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
      ],
    );
  }
}

class MyListItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageUrl;

  MyListItem(this.title, this.desc, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //设置边框
        border: Border.all(
          width: 6, //设置边框的宽度
          color: Colors.black38, //设置边框的颜色
        ),
      ),
      padding: EdgeInsets.all(2), //设置内边距
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //设置交叉轴的对齐方式
        children: <Widget>[
          SizedBox(
            height: 4,
          ),
          Text(
            title,
            style: TextStyle(color: Colors.black87, fontSize: 24),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            desc,
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          SizedBox(
            height: 6,
          ),
          Image.network(imageUrl)
        ],
      ),
    );
  }
}
