import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

/// 国际化：
///     arb文件全称Application Resource Bundle，表示应用资源包
///     其本质就是一个json文件，但是可以根据该文件转成对应的语言环境
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
        GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
        GlobalWidgetsLocalizations.delegate, // 指定默认的文本排列方向, 由左到右或由右到左
        S.delegate,
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildText(context),
            _buildRaisedButton(context),
          ],
        ),
      ),
    );
  }

  RaisedButton _buildRaisedButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
        );
      },
      child: Text(
        S.of(context).pickTime,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Text _buildText(BuildContext context) {
    return Text(
      S.of(context).hello,
      style: TextStyle(
        fontSize: 24,
      ),
    );
  }
}
