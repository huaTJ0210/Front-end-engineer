void main(List<String> args) {
  // (1) 数值类型 : num是一个抽象类代表整型或者浮点型
  num first = 0;
  int second = 0;
  double third = 0.0;
  print('${first.runtimeType},${second.runtimeType},${third.runtimeType}');
  // (2) 布尔类型 ： bool包含true和false
  bool isEmpty = false;
  print('${isEmpty.runtimeType}');
  // (3) 字符串类型
  String str1 = 'str1';
  print('字符串长度:${str1.length}');
  // A : 65
  print('65:${String.fromCharCode(65)}');
  // 返回指定索引位置的字符串
  print('${str1[0]}');
  // 前缀判断支持正则表达式
  var string = 'Dart';
  string.startsWith('D'); // true
  string.startsWith(new RegExp(r'[A-Z][a-z]')); // true
  string.endsWith('t'); //true
  // 获取子串：左闭右开
  print('substring:${string.substring(0, 2)}');
  // 如果字符串长度不够就在左侧填充指定字符串，以达到符合长度为止
  print('padLeft:${string.padLeft(10, '**')}');
}
