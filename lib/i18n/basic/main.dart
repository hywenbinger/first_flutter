import 'file:///D:/Work/Flutter/workspace/first_flutter/lib/i18n/basic/localization.dart';
import 'package:first_flutter/i18n/basic/localization_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// 国际化：
///     1.Widget国际化
///     2.文本国际化
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),

      /// 指定要支持哪些国际化
      supportedLocales: [
        Locale.fromSubtags(languageCode: "zh"),
        Locale("en"),
      ],

      /// 指定哪些Widget需要进行国际化
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
        GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
        GlobalWidgetsLocalizations.delegate, // 指定默认的文本排列方向, 由左到右或由右到左
        MyLocalizationsDelegate.delegate, // 自定义的LocalizationsDelegate
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyLocalizations.of(context).title),
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
        MyLocalizations.of(context).pickTime,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Text _buildText(BuildContext context) {
    return Text(
      MyLocalizations.of(context).hello,
      style: TextStyle(
        fontSize: 24,
      ),
    );
  }
}
