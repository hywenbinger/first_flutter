import 'package:flutter_driver/driver_extension.dart';
import 'package:first_flutter/test/my_counter.dart' as app;

/// 运行集成测试：
///     flutter drive --target=test_driver/app.dart
main() {
  /// 打开驱动
  enableFlutterDriverExtension();

  /// 启动应用程序
  app.main();
}
