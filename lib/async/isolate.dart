import 'dart:isolate';

import 'package:flutter/foundation.dart';

/// 在Dart中，有一个Isolate的概念，它是什么呢？
///
/// 我们已经知道Dart是单线程的，这个线程有自己可以访问的内存空间以及需要运行的事件循环；
/// 我们可以将这个空间系统称之为是一个Isolate；
/// 比如Flutter中就有一个Root Isolate，负责运行Flutter的代码，比如UI渲染、用户交互等等；
///
/// 在 Isolate 中，资源隔离做得非常好，每个 Isolate 都有自己的 Event Loop 与 Queue，
///
/// Isolate 之间不共享任何资源，只能依靠消息机制通信，因此也就没有资源抢占问题。
///
/// 但是，如果只有一个Isolate，那么意味着我们只能永远利用一个线程，这对于多核CPU来说，是一种资源的浪费。
/// 如果在开发中，我们有非常多耗时的计算，完全可以自己创建Isolate，在独立的Isolate中完成想要的计算操作。

main() async{
  print("main start");

  /// 创建Isolate
  Isolate.spawn(foo, "msg");

  /// Flutter提供了支持并发计算的compute函数，它内部封装了Isolate的创建和双向通信；
  /// 利用它我们可以充分利用多核心CPU，并且使用起来也非常简单；
  /// 由于compute是Flutter的API，所以只有在Flutter项目中才能运行；
//  int result = await compute<int, int>(multi, 100);
//  print("compute result is $result");

  print("main end");
}

void foo(info) {
  print("新的isolate：$info");
}

int multi(int num) {
  return num * num;
}
