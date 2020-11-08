import 'package:first_flutter/test/my_utils.dart';
import 'package:flutter_test/flutter_test.dart';

/// 单元测试
///     1.【test】：进行测试
///     2.【expect】：验证测试结果
///     3.【group】：同时进行多个测试
///     4.【setUpAll】：所有测试执行前执行，一般用于初始化
///     5.【tearDownAll】：所有测试执行完后执行，一般用于资源回收
main() {
  test("test sum function", testSum);

  test("test minus function", testMinus);

  group("test math utils", () {
    test("test sum function", testSum);

    test("test minus function", testMinus);
  });

  group("test Counter class", () {
    Counter counter;
    setUpAll(() {
      counter = Counter();
    });

    test("test counter increment", () {
      counter.increment();
      expect(counter.value, 1);
    });
    test("test counter decrement", () {
      counter.decrement();
      expect(counter.value, 0);
    });
  });
}

void testSum() {
  final value = sum(10, 60);
  expect(value, 70);
}

void testMinus() {
  final value = minus(10, 10);
  expect(value, 0);
}
