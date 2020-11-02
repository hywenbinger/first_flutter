import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyLocalizationsAsync {
  final Locale _locale;

  MyLocalizationsAsync(this._locale);

  static MyLocalizationsAsync of(BuildContext context) {
    return Localizations.of(context, MyLocalizationsAsync);
  }

  static var locals = ["en", "zh"];

  static Map<String, Map<String, String>> _localizedValues = {};

  Future loadJson() async {
    // 1.加载json文件
    final jsonString = await rootBundle.loadString("assets/json/i18n.json");

    // 2.对json进行解析
    Map<String, dynamic> map = json.decode(jsonString);

    _localizedValues = map.map((key, value) {
      return MapEntry(key, value.cast<String, String>());
    });
  }

  String get title {
    return _localizedValues[_locale.languageCode]["title"];
  }

  String get hello {
    return _localizedValues[_locale.languageCode]["hello"];
  }

  String get pickTime {
    return _localizedValues[_locale.languageCode]["pickTime"];
  }
}
