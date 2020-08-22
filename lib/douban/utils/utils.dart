import 'package:flutter/material.dart';

/// 自定义裁剪类
class MyRectClipper extends CustomClipper<Rect> {
  final double width;

  MyRectClipper(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(MyRectClipper oldClipper) {
    return width != oldClipper.width;
  }
}

/// 常量
class Constant {
  static const HOME_PAGE_OFFSET = 20;
}


