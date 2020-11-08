import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

/// 集成测试
main() {
  group("Counter application test", () {
    FlutterDriver flutterDriver;

    /// 异步初始化FlutterDriver
    setUpAll(() async {
      flutterDriver = await FlutterDriver.connect();
    });

    /// 关闭FlutterDriver
    tearDownAll(() {
      flutterDriver.close();
    });

    final textFinder = find.byValueKey("testText");
    final buttonFinder = find.byValueKey("testButton");

    /// 测试button点击
    test("test Counter button click", () async {
      await flutterDriver.tap(buttonFinder);
      expect(await flutterDriver.getText(textFinder), "1");
    });
  });

}
