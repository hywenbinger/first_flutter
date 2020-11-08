/// 顶层函数
int sum(int x, int y) {
  return x + y;
}

int minus(int x, int y) {
  return x - y;
}

/// 类
class Counter {
  int value = 0;

  int increment() => value++;

  int decrement() => value--;
}
