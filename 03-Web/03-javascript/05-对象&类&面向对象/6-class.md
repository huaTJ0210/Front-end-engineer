### 1、Class

#### 1.1 创建实例对象的方法

##### 1.1.1 ES5

```javascript
// 生成实例对象的方法
 function Point(x,y){
     this.x = x;
     this.y = y;
 }
 // 增加构造函数上的方法是通过原型对象
 Point.prototype.toString = function(){
     return '('+this.x +','+this.y+')';
 }
//  使用new关键字创建实例对象
 var p = new Point(1,2);
 console.log(p.toString());
console.log(p.hasOwnProperty('x')); // true
console.log(p); // 如下图：
```



##### 1.1.2 ES6

```javascript
// 以面向对象的形式，以类为模板创建对象
class Point{
    // 构造器
 constructor(x,y){
     this.x = x;
     this.y = y;
 }
 // 成员方法
 toString(){
     return '(' + this.x + ',' + this.y +')';
 }
}
// （1）类的数据类型是函数，类本身指向构造函数 
Point === Point.prototype.constructor
//  (2) 创建对象使用new命令
 var p = new Point(1,2);
 console.log(p.toString());
```

##### 1.1.3 类内部的方法都是不可枚举的

> ES5中是可以枚举定义在原型上的方法的

```javascript
class Point {
  constructor(x, y) {
    // ...
  }

  toString() {
    // ...
  }
}

Object.keys(Point.prototype)
// []
Object.getOwnPropertyNames(Point.prototype)
// ["constructor","toString"]  : 成员方法定义在类的原型对象上
```

#### 1.2 constructor方法

> constructor方法是默认构造函数，如果没有显示的声明，JavaScript引擎会默认创建一个无参的constructor方法

```javascript
// (1) 不显示创建constructor函数时；
class Point {
}

// 等同于
class Point {
  constructor() {}
}

// (2) 注意事项： constructor函数默认返回实例对象（即this），如果自定义对象返回，则导致创建的实例对象不属于该类
class Foo {
  constructor() {
    return Object.create(null);
  }
}

new Foo() instanceof Foo
// false
```

#### 1.3 类的实例

> 实例的属性除非显示定义在其本身（即定义在this对象上），否则都定义在原型上

```javascript
//定义类
class Point {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }
  toString() {
    return '(' + this.x + ', ' + this.y + ')';
  }
}

var point = new Point(2, 3); // 必须使用new关键字不然会报错

point.toString() // (2, 3)

point.hasOwnProperty('x') // true
point.hasOwnProperty('y') // true
point.hasOwnProperty('toString') // false
point.__proto__.hasOwnProperty('toString') // true
console.log(point);// 如下图：
```



#### 1.4 getter和setter函数

> 存值函数和取值函数是设置在属性的 Descriptor 对象上的。

```javascript
class CustomHTMLElement {
  constructor(element) {
    this.element = element;
  }

  get html() {
    return this.element.innerHTML;
  }

  set html(value) {
    this.element.innerHTML = value;
  }
}

var descriptor = Object.getOwnPropertyDescriptor(
  CustomHTMLElement.prototype, "html"
);

"get" in descriptor  // true
"set" in descriptor  // true
```

#### 1.5 this的指向问题

```javascript
// (1) 单独提取方法使用会引发this指向问题
class Logger {
  printName(name = 'there') {
    this.print(`Hello ${name}`);
  }
  print(text) {
    console.log(text);
  }
}
const logger = new Logger();
const { printName } = logger;
printName(); // TypeError: Cannot read property 'print' of undefined；当前this指向方法运行时所在的环境，找不到print的定义

// 解决方案： （1）在构造函数中绑定this
class Logger {
  constructor() {
    this.printName = this.printName.bind(this);
  }
  // ...
}

```

#### 1.6 静态方法

> 如果在一个方法前，加上`static`关键字，就表示该方法不会被实例继承，而是直接通过类来调用，这就称为“静态方法”。

```javascript
class Foo {
  static classMethod() {
    return 'hello';
  }
  static bar() {
    this.baz(); // 此时this关键字指向的是类而不是实例
  }
  static baz() {
    console.log('hello');
  }
}

Foo.classMethod() // 'hello'

var foo = new Foo();
foo.classMethod()
// TypeError: foo.classMethod is not a function
```

##### 1.6.1 子类继承父类的静态方法

```javascript
class Foo {
  static classMethod() {
    return 'hello';
  }
}

class Bar extends Foo {
  static classMethod() {
    return super.classMethod() + ', too'; // 通过super关键字进行调用
  }
}

Bar.classMethod() // "hello, too"
```

#### 1.7 实例属性的新写法

```javascript
class IncreasingCounter {
  /*
   （1）定义在构造函数中
   constructor() {
    this._count = 0;
  }
  */
  // (2) 统一定义在类的顶部
  _count = 0;
  get value() {
    console.log('Getting the current value!');
    return this._count;
  }
  increment() {
    this._count++;
  }
}
```

#### 1.8  new.target

> ES6 为`new`命令引入了一个`new.target`属性，该属性一般用在构造函数之中，返回`new`命令作用于的那个构造函数。如果构造函数不是通过`new`命令或`Reflect.construct()`调用的，`new.target`会返回`undefined`，因此这个属性可以用来确定构造函数是怎么调用的。

```javascript
function Person(name) {
  if (new.target !== undefined) {
    this.name = name;
  } else {
    throw new Error('必须使用 new 命令生成实例');
  }
}

// 另一种写法
function Person(name) {
  if (new.target === Person) {
    this.name = name;
  } else {
    throw new Error('必须使用 new 命令生成实例');
  }
}

var person = new Person('张三'); // 正确
var notAPerson = Person.call(person, '张三');  // 报错
```

### 2、Class的继承

#### 2.1 通过extends关键字实现继承

> ES5 的继承，实质是先创造子类的实例对象`this`，然后再将父类的方法添加到`this`上面（`Parent.apply(this)`）。
>
> ES6 的继承机制完全不同，实质是先将父类实例对象的属性和方法，加到`this`上面（所以必须先调用`super`方法），然后再用子类的构造函数修改`this`。

```javascript
// 父类
class Point {
  constructor(x,y){
    this.x = x;
    this.y = y;
  }
}

// 子类
class ColorPoint extends Point {
  constructor(x, y, color) {
    /*
      子类显式使用constructor方法就必须先调用super方法
      否则实例创建会出错；
      原因：子类的this对象必须先有父类的构造函数塑造后才能对其再加工
    */
    super(x, y); 
    this.color = color;
  }
  toString() {
    return this.color + ' ' + super.toString(); // 调用父类的toString()
  }
}
```

#### 2.2 Object.getPrototypeof()

```javascript
// 判断一个类是否继承了另一个类
Object.getPrototypeOf(ColorPoint) === Point
// true
```

#### 2.3 super关键字

#####  2.3.1  super作为函数调用，代表父类的构造函数

```javascript
class A {
  constructor() {
    console.log(new.target.name);
  }
}
class B extends A {
  constructor() {
    super(); // A.prototype.constructor.call(this)
  }
}
new A() // A
new B() // B

```

##### 2.3.2 super作为对象时，在普通方法中，指向父类的原型对象

```javascript
class A {
  constructor() {
    this.p = 2;
  }
}

class B extends A {
  get m() {
    return super.p; // super代表A的原型对象，而p是定义在A上所以获取不到
  }
}

let b = new B();
b.m // undefined
```

##### 2.3.3 ES6 规定，在子类普通方法中通过super调用父类的方法时，方法内部的this指向当前的子类实例。

```javascript
class A {
  constructor() {
    this.x = 1;
  }
  print() {
    console.log(this.x);
  }
}

class B extends A {
  constructor() {
    super();
    this.x = 2;
    super.x = 3; // this.x = 3;
    console.log(super.x); // undefined : A.prototype.x 未定义
    console.log(this.x); // 3
  }
  m() {
    super.print();// A.prototype.print.call(this);
  }
}

let b = new B();
b.m() // 2
```

##### 2.3.4 `super`在静态方法之中指向父类，在普通方法之中指向父类的原型对象。

```javascript
class Parent {
  static myMethod(msg) {
    console.log('static', msg);
  }

  myMethod(msg) {
    console.log('instance', msg);
  }
}

class Child extends Parent {
  static myMethod(msg) {
    super.myMethod(msg);
  }

  myMethod(msg) {
    super.myMethod(msg);
  }
}

Child.myMethod(1); // static 1

var child = new Child();
child.myMethod(2); // instance 2
```

#### 2.4、Mixin模式的实现

> Mixin 指的是多个对象合成一个新的对象，新对象具有各个组成成员的接口

```javascript
function mix(...mixins) {
  class Mix {
    constructor() {
      for (let mixin of mixins) {
        copyProperties(this, new mixin()); // 拷贝实例属性
      }
    }
  }

  for (let mixin of mixins) {
    copyProperties(Mix, mixin); // 拷贝静态属性
    copyProperties(Mix.prototype, mixin.prototype); // 拷贝原型属性
  }

  return Mix;
}

function copyProperties(target, source) {
  for (let key of Reflect.ownKeys(source)) {
    if ( key !== 'constructor'
      && key !== 'prototype'
      && key !== 'name'
    ) {
      let desc = Object.getOwnPropertyDescriptor(source, key);
      Object.defineProperty(target, key, desc);
    }
  }
}
```

##### 2.4.1 具体使用

```javascript
class DistributedEdit extends mix(Loggable, Serializable) {
  // ...
}
```

### 3、Module的语法

#### 3.1 简介

> + export显式指出输出的代码，规定模块对外的接口；
> + import输入其他模块提供的功能

#### 3.2 export命令

> 指定模块的输出「变量、函数、类」，export与其对应的值是动态绑定关系

```javascript
// profile.js

// 使用export命令输出变量
export let firstName = 'Michael';
export let lastName = 'Jackson';
export let year = 1958;
// 使用export命令输出函数
export function multiply(x, y) { 
    return x * y;
}

// 优先使用下面的统一输出方法 : 或者使用as起别名
export { firstName as firstNameProp, lastName, year };

// 【注意事项】：export输出的是对外接口，必须与模块内的变量保持一对一的关系
// 报错
export 1;

// 报错
var m = 1;
export m; // 实质还是输出的1

// 写法一
export let m = 1;

// 写法二
let m = 1;
export {m};

// 报错
function f() {}
export f;

// 正确
export function f() {};

// 正确
function f() {}
export {f};
```

#### 3.3 import

> 加载export导出的模块，

```javascript
// main.js
import { firstName, lastName, year } from './profile.js';

function setName(element) {
  element.textContent = firstName + ' ' + lastName;
}

// 输入的变量都是只读的，不可以修改，但是对象的属性可以进行修改
import {a} from './xxx.js'

a = {}; // Syntax Error : 'a' is read-only;
a.foo = 'hello'; // 合法操作
```

##### 3.3.1 模块的整体加载

> 模块的加载都是静态分析的，不允许运行时进行改变

```javascript
// circle.js

export function area(radius) {
  return Math.PI * radius * radius;
}

export function circumference(radius) {
  return 2 * Math.PI * radius;
}

// 通过整体加载
import * as circle from './circle';

console.log('圆面积：' + circle.area(4));
console.log('圆周长：' + circle.circumference(14));
```

##### 3.3.2 export default 

> 使用export default指定默认输出

```javascript
// (1) export default
export default function crc32() { // 输出
  // ...
}

import crc32 from 'crc32'; // 输入

// (2) export 
export function crc32() { // 输出
  // ...
};

import {crc32} from 'crc32'; // 输入
```

##### 3.3.3 跨模块常量 

> 一个常量值被多个模块共享；如果常量值较多可以创建constant目录，将常量写在不同文件中，使用index.js统一导出

```javascript
// constants.js 模块
export const A = 1;
export const B = 3;
export const C = 4;

// test1.js 模块
import * as constants from './constants';
console.log(constants.A); // 1
console.log(constants.B); // 3

// test2.js 模块
import {A, B} from './constants';
console.log(A); // 1
console.log(B); // 3
```

#### 3.4 Module的加载实现

##### 3.4.1 浏览器加载

```javascript
// (1) 传统加载模式：

// (1) - 1:阻塞渲染引擎的2种方式
<!-- 页面内嵌的脚本 -->
<script type="application/javascript">
  // module code
</script>

<!-- 外部脚本 -->
<script type="application/javascript" src="path/to/myModule.js">
</script>

// (2) -2: 异步加载
// defer:页面渲染完毕再执行
<script src="path/to/myModule.js" defer></script>
// async下载完毕就执行
<script src="path/to/myModule.js" async></script>
```

##### 3.4.2 加载规则

> 将type设置为module类型，浏览器会识别这是一个ES6模块

```javascript
<script type="module" src="./foo.js"></script>
<!-- 等同于 -->
<script type="module" src="./foo.js" defer></script>
```

##### 3.4.3 ES6模块与CommonJS模块的差异

> - CommonJS 模块输出的是一个【值的拷贝】，ES6 模块输出的是【值的引用】。
> - CommonJS 模块是【运行时加载】，ES6 模块是【编译时输出接口】。

```javascript
// mod.js
function C() {
  this.sum = 0;
  this.add = function () {
    this.sum += 1;
  };
  this.show = function () {
    console.log(this.sum);
  };
}

export let c = new C();

// x.js
import {c} from './mod';
c.add();

// y.js
import {c} from './mod';
c.show();

// main.js
import './x';
import './y';
// 现在执行main.js，输出的是1。这就证明了x.js和y.js加载的都是C的同一个实例。
```

