import 'dart:io';

main() {
  print("main start");
  getData();
  print("main end");
}


/// await 必须在 async 修饰的函数中使用
/// async 函数返回的结果必须是 Future
void getData() async {
  var result1 = await getNetData("arg1");
  print(result1);
  var result2 = await getNetData(result1);
  print(result2);
  var result3 = await getNetData(result2);
  print(result3);
}

Future getNetData(String arg) {
  return Future.delayed(Duration(seconds: 2), () {
    return "结果是：$arg";
  });
}
