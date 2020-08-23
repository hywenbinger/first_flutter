import 'package:first_flutter/douban/pages/group/group_page.dart';
import 'package:first_flutter/douban/pages/home/home_page.dart';
import 'package:first_flutter/douban/pages/mall/mall_page.dart';
import 'package:first_flutter/douban/pages/my/my_page.dart';
import 'package:first_flutter/douban/pages/subject/subject_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("豆瓣App"),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          HomePage(),
          SubjectPage(),
          GroupPage(),
          MallPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _createItem("home", "首页"),
          _createItem("subject", "书影音"),
          _createItem("group", "小组"),
          _createItem("mall", "市集"),
          _createItem("my", "我的"),
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xffdddddd),
        unselectedFontSize: 14,
        selectedFontSize: 14,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  BottomNavigationBarItem _createItem(String iconName, String title) {
    return BottomNavigationBarItem(
      title: Text(title),
      icon: Image.asset(
        "assets/images/bottom/$iconName.png",
        width: 24,
        gaplessPlayback: true,
      ),
      activeIcon: Image.asset(
        "assets/images/bottom/${iconName}_active.png",
        width: 24,
        gaplessPlayback: true, // 注意gaplessPlayback属性
      ),
    );
  }
}
