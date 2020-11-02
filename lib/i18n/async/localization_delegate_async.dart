import 'file:///D:/Work/Flutter/workspace/first_flutter/lib/i18n/basic/localization.dart';
import 'file:///D:/Work/Flutter/workspace/first_flutter/lib/i18n/async/localization_async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyLocalizationsDelegateAsync
    extends LocalizationsDelegate<MyLocalizationsAsync> {
  static MyLocalizationsDelegateAsync delegate = MyLocalizationsDelegateAsync();

  @override
  bool isSupported(Locale locale) {
    return MyLocalizationsAsync.locals.contains(locale.languageCode);
  }

  @override
  Future<MyLocalizationsAsync> load(Locale locale) async {
    final localizations = MyLocalizationsAsync(locale);
    await localizations.loadJson();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<MyLocalizationsAsync> old) {
    return false;
  }
}
