void main() {
  // (1) Dart是类型安全的语言：编译器会检测类型
  var name = 'hua'; // 使用var关键字直接声明，编译器自行推断
  String address = '朝阳区东三环'; // 使用具体数据类型指定变量
  print('${name + ':' + address}'); // 字符串支持插值操作
  // （2）常量和变量的声明
  const country = 'China'; // 编译时常量，声明时必须要指定初始值
  final city = 'beijing'; // 运行时常量，比如属性，可以在初始化函数中再赋值
  print('${country + ':' + city}');
  // (3) 如果不确定一个变量的类型
  dynamic roomName = 'li';
  roomName = 123;
  print(roomName);
  // (4)Object类型 
}
