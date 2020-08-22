import 'file:///D:/Work/Flutter/workspace/first_flutter/lib/douban/utils/utils.dart';
import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final double rating;
  final double maxRating;
  final int count;
  final double size;
  final Widget unselectedWidget;
  final Widget selectedWidget;
  final Color unSelectColor;
  final Color selectColor;

  StarRating(
      {double rating,
      this.maxRating = 10,
      this.count = 5,
      this.size = 50,
      Widget unselectedWidget,
      Widget selectedWidget,
      this.unSelectColor = Colors.grey,
      this.selectColor = Colors.redAccent})
      : unselectedWidget = unselectedWidget ??
            Icon(
              Icons.star,
              size: size,
              color: unSelectColor,
            ),
        selectedWidget =
            selectedWidget ?? Icon(Icons.star, size: size, color: selectColor),
        rating = rating > maxRating ? maxRating : rating;

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildUnSelectWidget(),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildSelectWidget(),
        ),
      ],
    );
  }

  /// 创建未选中的Widget
  List<Widget> buildUnSelectWidget() {
    return List.generate(
      widget.count,
      (index) => widget.unselectedWidget,
    );
  }

  /// 创建选中的Widget
  List<Widget> buildSelectWidget() {
    List<Widget> widgets = [];
    // 1.计算Star个数和剩余比例等
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();
    double leftValue = widget.rating - entireCount * oneValue;
    double leftRatio = leftValue / oneValue;
//    print("计算：$oneValue, $entireCount, $leftValue, $leftRatio");
    // 2.集合中加入[填充满的widget]
    for (int i = 0; i < entireCount; i++) {
      widgets.add(widget.selectedWidget);
    }
    // 3.集合中加入[剩余部分的widget]
    if (leftValue > 0) {
      widgets.add(
        ClipRect(
          child: widget.selectedWidget,
          clipper: MyRectClipper(leftRatio * widget.size),
        ),
      );
    }
    return widgets;
  }
}
