import 'package:first_flutter/anim/anim_hero_detail.dart';
import 'package:flutter/material.dart';

/// Hero动画
///     1.共享元素的Widget包裹Hero
///     2.设置相同的tag
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Animation"),
      ),
      body: _getGridView(context),
    );
  }

  Widget _getGridView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 2,
        ),
        children: List.generate(20, (index) {
          String imageURL = "https://picsum.photos/400/200?random=$index";
          return GestureDetector(
            onTap: () {
              _jumpToDetailPage(context, imageURL);
            },

            /// 第一步：Widget包裹Hero
            child: Hero(
              /// 第二步：设置tag
              tag: imageURL,
              child: Image.network(
                imageURL,
                fit: BoxFit.cover,
              ),
            ),
          );
        }),
      ),
    );
  }

  /// 跳到图片预览界面
  void _jumpToDetailPage(BuildContext context, String imageURL) {
//    Navigator.of(context).push(
//      MaterialPageRoute(
//        builder: (context) {
//          return HeroDetailPage();
//        },
//        fullscreenDialog: true,
//      ),
//    );

    Navigator.of(context).push(PageRouteBuilder(
      transitionDuration: Duration(
        milliseconds: 500,
      ),
      pageBuilder: (ctx, animation1, animation2) {
        return FadeTransition(
          opacity: animation1,
          child: HeroDetailPage(imageURL),
        );
      },
    ));
  }
}
