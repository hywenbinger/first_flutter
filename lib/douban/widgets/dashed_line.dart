import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final Axis axis;
  final double width;
  final double height;
  final int count;
  final Color color;

  DashedLine(
      {this.axis = Axis.horizontal,
      this.width = 1,
      this.height = 1,
      this.count = 10,
      this.color = Colors.red});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // 根据宽度计算个数
        return Flex(
          direction: this.axis,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(this.count, (int index) {
            return SizedBox(
              width: width,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
