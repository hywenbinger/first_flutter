import 'dart:ui';

class SizeFit {
  /// 屏幕物理宽度
  static double screenWidth;

  /// 屏幕物理高度
  static double screenHeight;

  /// 屏幕逻辑宽度
  static double width;

  /// 屏幕逻辑高度
  static double height;

  /// 屏幕密度
  static double dpr;

  static void initialize() {
    screenWidth = window.physicalSize.width;
    screenHeight = window.physicalSize.height;
    dpr = window.devicePixelRatio;
    width = screenWidth / dpr;
    height = screenHeight / dpr;
    print(
        "screenWidth = $screenWidth, screenHeight = $screenHeight, dpr = $dpr");
  }

  static double dpr2px(double size) {
    return size * dpr;
  }

  static double px2dpr(double size) {
    return size / dpr;
  }
}

