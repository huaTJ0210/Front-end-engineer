##  1、变量

### 1.1 类型推断

```Dart
// 类型推断：name为String类型，
// 【风格指南】使用var声明局部变量而非具体的类型
var name = "Bob"；
 // 如果一个对象的引用不局限于单一类型那么可以声明为：Object或dynamic
dynamic responseData; 
```

### 1.2 常量声明

```Dart
final name = "Bob";
const PI = 3.1415 ; // 修饰的为编译时常量
```

### 1.3 类型检查和强制类型转换

```Dart
const Object i = 3;
const list = [i as int]; // 类型转换
const map = {if(i is int) i : 'int'};// 类型检查
```



## 其他

### 实现单例模式

```Dart
class Manager {
  // 工厂模式
  factory Manager() =>_getInstance()
  static Manager get instance => _getInstance();
  static Manager _instance;
  Manager._internal() {
    // 初始化
  }
  static Manager _getInstance() {
    if (_instance == null) {
      _instance = new Manager._internal();
    }
    return _instance;
  }
}

// 无论如何初始化，取到的都是同一个对象
Manager manager = new Manager();
Manager manager2 = Manager.instance;
```

