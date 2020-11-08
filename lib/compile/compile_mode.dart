import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

/// 编译模式
///
/// Debug模式
///     1.断言是开启的（Assertions）
///     2.服务扩展是开启的（Service extension）
///         runApp -> WidgetsFlutterBinding -> initServiceExtensions
///     3.开启调试，类似于 DevTools 工具可以连接到应用程序的进程中
///     4.针对快速开发和运行周期进行了编译优化（但不是针对执行速度、二进制文件大小或者部署）
///         比如 Dart 是 JIT 模式（Just In Time，即时编译，也可以理解成边运行边编译）
///     5.热重载（Hot Reload）功能仅能在调试模式下运行
///     6.模拟器仅能在调试模式下运行
///     7.在 Debug 模式下，应用可能会出现掉帧或者卡顿现象
///     8.默认情况下，运行 flutter run 会使用 Debug 模式；点击 Android Studio run 按钮，也是 Debug 模式
///
/// Release模式
///     1.Release 模式下是只能在真机上运行
///     2.断言是无效的
///     3.服务扩展是无效的
///     4.debugging是无效的
///     5.编译针对快速启动、快速执行和小的 package 的大小进行了优化
///         比如 Dart 是 AOT 模式（Ahead Of Time，预先编译）
///     6.flutter run --release 命令会使用 Release 模式来进行编译，也可以在 Android Studio 进行配置
///
/// Profile模式
///     1.和 Release 模式类似，但是会保留一些信息方便我们对性能进行检测
///     2.保留开启了一些扩展
///     3.DevTools 工具可以连接到应用程序的进程中
///
/// 开发中怎么区分模式
///     1.通过 assert 断言，因为在 Release 模式下断言是无效的
///     2.通过 kDebugMode/kReleaseMode/kProfileMode 常量来区分
///
main() {
  String baseUrl = "https://release.url";

  /// 第1种方式
  if (kDebugMode) {
    baseUrl = "https://debug.url";
  }

  /// 第2种方式
  assert(() {
    baseUrl = "https://debug.url";
    return true;
  }());
}
