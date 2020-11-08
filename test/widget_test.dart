// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:first_flutter/test/my_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Widget测试
///     1.【testWidgets】：进行widget测试
///     2.【pumpWidget】：注入widget开始渲染
///     3.【find】：查找widget
void main() {
  testWidgets("test MyListView", (widgetTester) async {
    var listView = MyListView(["NBA", "CBA", "ABA", "BBA"]);

    /// 注入widget开始渲染
    /// 注意：一定要包裹MaterialApp
    await widgetTester.pumpWidget(MaterialApp(home: listView));

    /// 在widget中查找
    final nbaText = find.text("NBA");

    /// 验证
    expect(nbaText, findsOneWidget);
  });
}
