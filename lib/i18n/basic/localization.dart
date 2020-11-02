import 'package:flutter/material.dart';

class MyLocalizations {
  final Locale _locale;

  MyLocalizations(this._locale);

  static MyLocalizations of(BuildContext context) {
    return Localizations.of(context, MyLocalizations);
  }

  static var locals = ["en", "zh"];

  static Map<String, Map<String, String>> _localizedValues = {
    locals[0]: {
      "title": "Internationalization",
      "hello": "Hello Flutter",
      "pickTime": "Pick Time",
    },
    locals[1]: {
      "title": "国际化",
      "hello": "你好Flutter",
      "pickTime": "选择时间",
    }
  };

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
