import 'package:first_flutter/douban/pages/home/home_model.dart';
import 'package:first_flutter/douban/pages/home/home_request.dart';
import 'package:first_flutter/douban/widgets/dashed_line.dart';
import 'package:flutter/material.dart';
import 'home_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MovieModel> movies = [];

  @override
  void initState() {
    super.initState();
    //发送网络请求
    HomeRequest.requestTop250(0).then((value) {
      setState(() {
        movies.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      //内容
      itemBuilder: (context, index) {
        return HomeItem(movies[index]);
      },
      //分割线
      separatorBuilder: (context, index) {
        return DashedLine(
          count: 30,
          width: 6,
        );
      },
      //个数
      itemCount: movies.length,
    );
  }
}
