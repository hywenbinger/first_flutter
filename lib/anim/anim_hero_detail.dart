import 'package:flutter/material.dart';

class HeroDetailPage extends StatelessWidget {
  final String _imageURL;

  HeroDetailPage(this._imageURL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },

          /// 第一步：Widget包裹Hero
          child: Hero(
            /// 第二步：设置tag
            tag: _imageURL,
            child: Image.network(
              _imageURL,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
