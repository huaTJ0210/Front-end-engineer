### 1、函数
#### 1.1 函数概述
> 函数是一段可以反复调用的代码块；

```javascript
function foo(x,y){
  if(typeof x === 'number' && typeof y === 'number'){
    return x + y;
  }else{
    return 0;
  }
}
```
#### 1.2 函数声明
##### 1.2.1 function命令

```javascript
function add(a,b){
  a = +a;
  b = +b;
  if(isNaN(a) || isNaN(b)){
    return;
  }
  return a + b;
}
```
##### 1.2.2 函数表达式

> 将匿名函数赋值给变量，匿名函数又叫做函数表达式

```javascript
var add = function(a,b){
  // do sth
};
```
##### 1.2.3 Function构造函数

> `Function`构造函数接受三个参数，除了最后一个参数是`add`函数的“函数体”，其他参数都是`add`函数的参数

```javascript
var add = new Function(
  'x',
  'y',
  'return x + y'
);

// 等同于
function add(x, y) {
  return x + y;
}
```

#### 1.3 this

##### 1.3.1 全局的this（浏览器）
```javascript
// true
console.log(this.document === document);
//true
console.log(this === window);

this.a = 37;
console.log(window.a); // 37
```
##### 1.3.2 一般函数的this（浏览器）
```javascript
function f1(){
  return this;
}
f1() === window;//true

function f2(){
 "use strict";//严格模式下
  return this;
}
f2() === undefined;// true
```
##### 1.3.3 作为对象方法的函数的this
```javascript
// (1)
var o ={
  prop: 37,
  f:function(){
    // this 等于当前对象 o
    return this.prop;
  }
};
console.log(o.f());// 37

// (2) this 等于当前对象 o 
var o ={prop:37};
function independent(){
  return this.prop;
}
o.f = independent;
console.log(o.f());
```
##### 1.3.4  对象原型链上的this
```javascript
var o = {f:function(){
  return this.a + this.b;
}};
var p = Object.create(o);
p.a = 1;
p.b = 4;

console.log(p.f());//5
```
##### 1.3.5 get/set方法与this
```javascript
function modulus(){
   return Math.sqrt(this.re * this.re + this.im * this.im);
}

var o = {
  re:1,
  im:-1,
  get phase(){
    return Math.atan2(this.im + this.re);
  }
}

Object.defineProperty(o,'modulus',{
  get : modulus,enumerable:true,configurable:true
});

console.log(o.phase,o.modulus);// -0.78 1.4142
```
##### 1.3.6 构造器中的this
```javascript
function MyClass(){
 this.a = 37;
}

var o = new MyClass();
console.log(o.a);//37

function C2(){
  this.a = 37;
  return {a:38};
}
o = new C2();
console.log(o.a);// 38
```
##### 1.3.7 call/apply方法与this
```javascript
function add(c,d){
  return this.a + this.b + c + d;
}

var o = {a:1,b:3};
add.call(o,5,7);// 1+3+5+7 = 16
add.apply(o,[10,20]); // 1+3+10+20 = 34

function bar(){
  console.log(Object.prototype.toString.call(this));
}
bar.call(7);// "[object Number]"
```
##### 1.3.8 bind方法与this
```javascript
function f(){
  return this.a;
}
// bind接收一个对象，当你想把函数的this指针修改时可以采用bind
var g = f.bind({a:"test"});
console.log(g());// test

var o = {a:37,f:f,g:g};
console.log(o.f(),o.g());//37,test
```


#### 1.4 函数属性和方法
##### 1.4.1 函数属性&arguments
```javascript
foo(1,2);
foo.length;//3 函数定义时形参数个数，不会发生改变
foo.name;// "foo"
foo.toString();// 返回字符串，函数实现的源码

function foo(x,y,z){
  arguments.length;// 2 实参个数
  arguments[0];// 1
  arguments[0] = 10;
  x; // change to 10;
  
  arguments[2] = 100；
  z; // still undefined!!!
}
```
##### 1.4.2 apply/call方法（浏览器）
```javascript
function foo(x,y){
  console.log(x,y,this);
}
foo.call(100,1,2);// 1,2, Number(100)
foo.apply(true,[3,4]);// 3,4,Boolean(true)
foo.apply(null);//undefined undefined window
foo.apply(undefined);//undefined undefined window
```
##### 1.4.3 bind方法
```javascript
this.x = 9;
var module = {
  x:81,
  getX:function(){
    return this.x;
  }
};

module.getX(); // 81

var getX = module.getX;
getX();//9

var boundGetX = getX.bind(module);
boundGetX();// 81
```
##### 1.4.4 bind与currying[柯里化]
```javascript
function add(a,b,c){
  return a + b + c;
}

var func = add.bind(undefined,100);
func(1,2);// 103
var func2 = func.bind(undefined,200);
func2(10);//310

// 用途
function getConfig(colors,size,otherOptions){
  console.log(colors,size,otherOptions);
}

var defaultConfig = getConfig.bind(null,'#CC0000',"1024");
defaultConfig("123"); // #CC0000 1024*768  123
```
##### 1.4.5 bind与new
```javascript
function foo(){
  this.b = 100;
  return this.a;
}
var func = foo.bind({a:1});

func();// 1 当前this 指向 {a:1}因此返回值为 1
new func();//{b:100} 当前this指向一个对象（obj），这个对象的原型为foo.prototype
// 函数没有返回对象，因此函数会将this返回，也就是obj
```
#### 1.5 函数作用域

##### 1.5.1 作用域

> 作用域（scope）指的是变量存在的范围。
>
> 在 ES5 的规范中，JavaScript 只有两种作用域：一种是全局作用域，变量在整个程序中一直存在，所有地方都可以读取；另一种是函数作用域，变量只在函数内部存在

##### 1.5.2 函数本身的作用域

> 函数本身也是一个值，也有自己的作用域。它的作用域与变量一样，就是其声明时所在的作用域，与其运行时所在的作用域无关。

+ 场景（一）

  ```javascript
  var a = 1;
  var x = function () {
    console.log(a);
  };
  
  function f() {
    var a = 2;
    x();
  }
  
  f() // 1 : x()函数调用取的是函数在定义时a变量所在的作用域
  ```

+ 场景（二）

  ```javascript
  var x = function () {
    console.log(a);
  };
  
  function y(f) {
    var a = 2;
    f();
  }
  
  y(x)
  // ReferenceError: a is not defined
  ```

#### 2、闭包与作用域

##### 2.0 闭包概念
> 由于在 JavaScript 语言中，只有函数内部的子函数才能读取内部变量，因此可以把闭包简单理解成“定义在一个函数内部的函数”。闭包最大的特点，就是它可以“记住”诞生的环境。在本质上，闭包就是将函数内部和函数外部连接起来的一座桥梁。

> 注意使用闭包的问题: 外层函数每次运行，都会生成一个新的闭包，而这个闭包又会保留外层函数的内部变量，所以内存消耗很大。因此不能滥用闭包，否则会造成网页的性能问题。

```javascript
// (1) 函数外部无法读取函数内部声明的变量
function f1(){
  var n = 999
}
console.log(n);// n is not defined

// (2) 函数内部的局部变量可以在函数内部定义一个函数来读取
function f1(){
  var n = 999
  function f2(){
    console.log(n);// 999
  }
}

// (3) 将函数内部定义的内部函数作为返回值返回，这样在函数外部就能读取到函数内的局部变量了
function f1(){
  var n = 999
  function f2(){
    console.log(n);// 999
  }
  return f2;
}
var result = f1();
result();// 999  : 闭包就是函数f2，即能够读取其他函数内部变量的函数
```

##### 2.1 闭包的用处

> 闭包的最大用处有两个：
>
> 一个是可以读取函数内部的变量，另一个就是让这些变量始终保持在内存中，即闭包可以使得它诞生环境一直存在；
>
> 闭包可以看作是函数内部作用域的一个接口

###### 2.1.1 闭包使得内部变量记住上一次调用时的运算结果。

```javascript
function createIncrementor(start) {
  return function () {
    return start++;
  };
}

var inc = createIncrementor(5);

inc() // 5
inc() // 6
inc() // 7
// 原因就在于inc始终在内存中，而inc的存在依赖于createIncrementor，因此也始终在内存中，不会在调用结束后，被垃圾回收机制回收。
```

###### 2.1.2 封装对象的私有属性和私有方法

```javascript
function Person(name) {
  var _age;
  function setAge(n) {
    _age = n;
  }
  function getAge() {
    return _age;
  }

  return {
    name: name,
    getAge: getAge,
    setAge: setAge
  };
}

var p1 = Person('张三');
p1.setAge(25);
p1.getAge() // 25
```

##### 2.2 闭包实例
```javascript
// 基本函数
function outer(){
  var localVal = 30;
  return localVal;
}
outer();// 30

// 函数内部返回函数
function outer(){
  var localVal = 30;
  return function(){
    return localVal;
  }
}

var func = outer();
func();// 30
```
##### 2.3 闭包-常见错误之循环闭包
```javascript
document.body.innerHTML = "<div id=div1>aaa</div>" + "<div id=div2>bbb</div>" + "<div id=div3>ccc</div>"
for(var i= 1;i < 4;i++){
  document.getElementById('div'+i).
  addEventListener('click',function(){
    alert(i);  // all are 4
  });
}

// 如何解决上述问题:
for(var i= 1;i < 4;i++){
 !function(i){
     document.getElementById('div'+i).
     addEventListener('click',function(){
     alert(i);  // 
    });
 }(i);
}
```
##### 2.4 立即执行函数

> 定义函数后立即调用

```javascript
function(){ /* code */ }();
// SyntaxError: Unexpected token 
// JavaScript 规定，如果function关键字出现在行首，一律解释成语句。因此，引擎看到行首是function关键字之后，认为这一段都是函数的定义，不应该以圆括号结尾，所以就报错了

// 解决方法：添加小括号：这种写法就叫做立即调用函数：IIFE
(function(){ /* code */ }());
```

>  【立即执行函数的使用场景】
>
>  一、是不必为函数命名，避免了污染全局变量；
>
>  二、是 IIFE 内部形成了一个单独的作用域，可以封装一些外部无法读取的私有变量。

```javascript
// 写法一 : 完全污染了全局变量
var tmp = newData;
processData(tmp);
storeData(tmp);

// 写法二
(function () {
  var tmp = newData;
  processData(tmp);
  storeData(tmp);
}());
```

