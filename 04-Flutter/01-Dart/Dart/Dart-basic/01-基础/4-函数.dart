void main(List<String> args) {
  // 1、函数参数
  printInfo(msg: 'hello world');
  test();
  // 2、函数作为另外一个函数的参数
  var list = [1, 2, 3];
  list.forEach(printElement);
  // 3、匿名函数：lambda或者closure
  var listFruit = ['apples', 'bananas', 'oranges'];
  listFruit.forEach((item) {
    print('${listFruit.indexOf(item)}:$item');
  });
  // 4、词法闭包：函数的对象在它词法作用域之外，仍旧能够访问它词法作用域的变量
  var add2 = makeAdder(2); // 创建一个加2的函数
  print(add2(3));
}

// (2) 词法闭包
Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}

// (1) 函数是一等对象，他可以作为另一个函数的参数
void printElement(int element) {
  print(element);
}

// 可选命名参数
void printInfo({String msg}) {
  print('${msg}');
}

// 可选参数
void test([String msg]) {
  if (msg == null) {
    print('msg 参数未传递');
  } else {
    print('${msg}');
  }
}
