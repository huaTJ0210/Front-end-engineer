/*
  (1) Future 类似与JavaScript中的Promise，代表将来某个时刻会返回一个结果；
 （2） Stream类可以用来获取一系列的值
*/


// (1) 定义异步函数只需要在普通方法上添加async关键字即可
Future<String> lookUpVersion() {
  return Future.delayed(new Duration(seconds: 2), () {
    return '1.0.0';
  });
}

Future<void> main() async {
  var version = await lookUpVersion();
  print(version);
  print('main method!!');
}
