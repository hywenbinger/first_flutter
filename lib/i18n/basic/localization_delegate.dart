import 'file:///D:/Work/Flutter/workspace/first_flutter/lib/i18n/basic/localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 自定义Delegate，将其传入localizationsDelegates
/// Delegate的作用就是当Locale发生改变时，调用对应的load方法，重新加载新的Locale资源
class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {
  static MyLocalizationsDelegate delegate = MyLocalizationsDelegate();

  /// 用于判断当前环境的Locale，是否在我们支持的语言范围
  @override
  bool isSupported(Locale locale) {
    print("MyLocalizationsDelegate.isSupported, languageCode = ${locale.languageCode}");
    return MyLocalizations.locals.contains(locale.languageCode);
  }

  /// 当Locale发生改变时，加载对应的MyLocalizations资源
  /// 这个方法返回的是一个Future，因为有可能是异步加载的；
  /// 但是我们这里是直接定义的一个Map，因此可以直接返回一个同步的Future（SynchronousFuture）
  @override
  Future<MyLocalizations> load(Locale locale) {
    print("MyLocalizationsDelegate.load, languageCode = ${locale.languageCode}");
    return SynchronousFuture(MyLocalizations(locale));
  }

  /// 当Localizations Widget重新build时，是否调用load方法重新加载Locale资源
  /// 一般情况下，Locale资源只应该在Locale切换时加载一次，不需要每次Localizations Widget重新build时都加载一遍，
  /// 所以一般情况下返回false即可；
  @override
  bool shouldReload(covariant LocalizationsDelegate<MyLocalizations> old) {
    return false;
  }
}
