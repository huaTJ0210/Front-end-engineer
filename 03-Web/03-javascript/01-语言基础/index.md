# 语言基础

## 1、JavaScript语言概述

> + 脚本语言（script language）：不具备开发操作系统的能力，用来编写控制应用程序（浏览器）的脚本；
>
> + 嵌入式语言：依附于宿主环境（浏览器、服务器：Node），调用宿主环境提供的API；
>
> + JavaScript不是纯粹的面向对象编程语言，同时支持其他编程范式（函数式编程）
> + 操控浏览器的能力、Node、数据库操作、移动平台开发、跨平台的桌面应用

##  2、基本语法

### 1、 区分大小写

>无论变量名、函数名、操作符均区分大小写

```javascript
// 以下两种变量为不同的变量
var test；
var Test；
```

### 2、 标识符

> 标识符指的是用来识别各种值（变量、函数、属性或者函数参数）的合法名称;
>
> 标识符有一套命名规则（关键字、保留字不能作为标识符），不符合规则的就是非法标识符；
>
> JavaScript 引擎遇到非法标识符，就会报错；

### 3、 语句

> 语句是为了完成某种任务而进行的操作，以分号结尾，省略分号意味着由解析器确定语句在哪里；

```javascript
// （0） 赋值语句
var a = 1 + 3 ; 
var b = 'abc';

// (1) if-else结构
var m = 0;
if (m === 3) {
  m += 1;
}else{
  m -= 1;
}

// (2)switch结构
var fruit = "apple";
switch (fruit) {
  case "banana":
    // ...
    break;
  case "apple":
    // ...
    break;
  default:
    // ...
}

// (3)三元运算符 : (条件) ? 表达式1 : 表达式2
var even = (n % 2 === 0) ? true : false;

// (4) 循环语句 : while、for、do...while等
```

### 4、 变量

> 变量就是为”值“起名，然后引用这个名字;

#### 4.1 var 关键字

> var [变量名称]  ： 可以定义任意数据类型的变量

```javascript
  var a = 1;
	var b;// 只声明未赋值，则该变量的值为undefined
	c;// 未声明直接使用： ReferenceError： x is not defined 
```

##### 4.1.1 区块

> JavaScript 使用大括号，将多个相关的语句组合在一起，称为“区块”（block）。

```javascript
 // (1) 普通块
  {
    var a = 1
  }
  console.log('a=' + a) // a=1 ； 此区块不构成单独的作用域scope

  // (2) 函数块
  function fuc() {
    var b = 1
  }
  console.log('b=' + b) // Uncaught ReferenceError: b is not defined: 函数块存在作用域

  // (3) 条件判断
  var allowed = false
  if (allowed) {
    var c = 1
  }
  console.log('c=' + c) // c=undefined ： 判断语句也不构成单独的作用域
```

##### 4.1.2 var 声明的作用域

> var [变量名称]  ： 可以定义任意数据类型的变量

```javascript
  // (1) 场景一 : 变量声明位于函数作用域中
function foo(){
  var message = "hi";// 局部变量
}
foo();
console.log(message);//  ReferenceError： message is not defined 

  // (2) 场景二 ：变量声明被提升到全局作用域中
function foo(){
   message = "hi";// 全局变量
}
foo();
console.log(message);//  "hi"
```

##### 4.1.3 var声明变量提升

> JavaScript 引擎的工作方式是，先解析代码，获取所有被声明的变量，然后再一行一行地运行。
>
> 这造成的结果，就是所有的变量的声明语句，都会被提升到代码的头部，这就叫做变量提升（hoist）。

```javascript
// （1）变量提升场景一：
console.log(a);// undefined 
var	a = 1;

// 上述代码等价与👇
var a;
console.log(a);
a = 1; // 由于变量的提升导致了a的声明被提前声明了


// （2）变量提升场景二：
var tmp = new Date();
function func() {
    // var tmp；会被隐式提升到这里
    console.log("1===>" + tmp); // undefined
    if (false) {
        var tmp = "hello"; // var tmp；声明会被提升；流程控制语句的{},不算作用域 【不存在块级作用域】
    }
    console.log('2===>' + tmp); // undefined : if判断为false，未执行tmp的赋值
}
func();
```

##### 4.1.4 var声明变量的问题

```javascript
// 1 可以重复声明
var a = 12;
var a = 5;
// 2 无法限制修改，没有常量概念
var x = 4;
x = 5;
// 3 没有块级作用域 ：条件语句、循环语句等都不构成作用域
{
  var y = 0; 
}
console.log(y);// 0
// 4 
```

#### 4.2 let声明变量

> let声明的范围是块作用域

#####  4.2.1 为什么需要块级作用域

```javascript
// 1、 内层变量可能会覆盖外层变量
var tmp = new Date();

function f() {
  console.log(tmp);
  if (false) {
    var tmp = 'hello world';
  }
}

f(); // undefined

// 2、 计数的循环变量泄露为全局变量
var s = 'hello';

for (var i = 0; i < s.length; i++) {
  console.log(s[i]);
}

console.log(i); // 5

// （3） 局部变量的写法
// IIFE 匿名立即执行函数,封装一个局部变量
(function(){
  var temp = '';
})();
// 块级作用域写法
{
  let tmp = '';
}
```

##### 4.2.2 let的使用

```javascript
 // 1、let声明的变量超出块级作用域就无效
{
  let a = 10;
  var b = 1;
}
 a;// a is not defined
 b; // 1

// 2、 对于for循环就适合使用let
for(let i = 0; i < 10; i++){ 
 // ---
}
console.log(i); // ReferenceError : i is not defined

// 3 : 循环变量与内部变量也不是在一个作用域 ：设置循环变量的是父作用域，每轮循环都是新的作用域
for (let i = 0; i < 3; i++) {
  let i = 'abc'; // 子作用域
  console.log(i);
}
// abc
// abc
// abc

// 4、let解决for循环闭包问题
var a = [];
for(var i = 0; i < 10 ; i++){
  a[i] = function(){
    console.log(i);
  };
}
a[6](); // 10: 闭包持有的i是全局的，导致每次循环i的值都会变化，最终数组中存储的i都为10

// 修改成以下方式就能解决：每次循环都是创建一个新的i变量，对于循环计数JavaScript引擎有记录
var a = [];
for (let i = 0; i < 10; i++) {
  a[i] = function () {
    console.log(i);
  };
}
a[6](); // 6

// 5、 let声明的变量不会在作用域中被提升（暂时性死区）
console.log(name);// undefined
var name = "Matt";

console.log(age); // error
let age = 18;
```

#### 4.3 const的使用

> const与let基本相同，使用它声明变量必须同时初始化变量，且尝试修改则会有运行时的错误产生；

```javascript
// (1) 基本使用
const age = 26;
age = 18;// TypeError

// (2) 引用类型的常量声明：常量`foo`储存的是一个地址，这个地址指向一个对象。
//不可变的只是这个地址，即不能把`foo`指向另一个地址，但对象本身是可变的，所以依然可以为其添加新属性

const foo = {};

// 为 foo 添加一个属性，可以成功
foo.prop = 123;
foo.prop // 123

// 将 foo 指向另一个对象，就会报错
foo = {}; // TypeError: "foo" is read-only

// 如果真想冻结对象不可以修改
const foo = Object.freeze({});
// 常规模式时，下面一行不起作用；
// 严格模式时，该行会报错
foo.prop = 123;
```

#### 4.4 声明风格建议

> 不使用var，const优先，let次之

### 5、数据类型

#### 0、typeof操作符

> 可以返回一个值的数据类型

```javascript
// 判断基本类型 
typeof 100  // "number"  ： 数值
typeof true // "boolean"  ： 布尔值
typeof 'hello' // "string"  ： 字符串
typeof function // "function"    ： 函数
typeof undefined // "undefined"  : 值未定义
typeof Symbol // "symbol" :符号

typeof new Object() // "object"
typeof [1,2] // "object"
typeof NaN // "number"
typeof null // "object"  ： null被认为是一个对空对象的引用
```

#### 1、Boolean

```javaScript
// (1) 作为构造函数
var b = new Boolean(true);
typeof b; // "object"
b.valueOf(); // true

// (2) Boolean 作为单独的转化工具函数，能把其他对象转化为布尔值
Boolean(undefined); // false
Boolean(null); // false
Boolean(0); // false
Boolean(''); // false
Boolean(NaN); // false

Boolean(1); // true
Boolean('false'); // true
Boolean([]); // true
Boolean({}); // true
Boolean(function () {}); // true
Boolean(/foo/); // true
```

#### 2、 特殊类型

##### 2.1 Null

> null ：表示是一个表示“空”的对象，转为数值时为0;
>
> null使用场景：
>
> null`表示空值，即该处的值现在为空。调用函数时，某个参数未设置任何值，这时就可以传入`null`，表示该参数为空。`
>
> 比如，某个函数接受引擎抛出的错误作为参数，如果运行过程中未出错，那么这个参数就会传入`null`，表示未发生错误；
>
> 【解析网络请求数据时，会出现null的情况】

##### 2.2 Undefined

> 是一个表示"此处无定义"的原始值，转为数值时为NaN

```javascript
/*
 null和undefined都表示空，在if语句中都会被自动转为false
*/
if (!undefined) {
  console.log('undefined is false');
}
// undefined is false

if (!null) {
  console.log('null is false');
}
// null is false

undefined == null
// true
```

##### 2.3 null和undefined含义差不多，为什么要设置两个这样的值？

> JavaScript的诞生之初，借鉴java只设置了null表示“无”；但是null转数字时，会自动变0；
>
> 设计者表示如果null自动转为0，很不容易发现错误，就又设计了undefined，表示“此处无定义”的原始值，转为数字为NaN

#### 3、Number类型

##### 3.1 整数和浮点数

> JavaScript 内部，所有数字都是以64位浮点数形式储存，即使整数也是如此。所以，`1`与`1.0`是相同的，是同一个数。

```javascript
// 浮点数不是精确的值所以涉及小数的比较和运算要特别小心
1 === 1.0 // true
0.1 + 0.2 === 0.3
// false
0.3 / 0.1
// 2.9999999999999996
(0.3 - 0.2) === (0.2 - 0.1)
// false
```

##### 3.2 数值精度

> javaScript 浮点数的64个二进制位，从最左边开始，是这样组成的。
>
> - 第1位：符号位，`0`表示正数，`1`表示负数
> - 第2位到第12位（共11位）：指数部分 ,决定数值的大小
> - 第13位到第64位（共52位）：小数部分（即有效数字）

```javascript
// 大于2的53次方以后，整数运算的结果开始出现错误。所以，大于2的53次方的数值，都无法保持精度。由于2的53次方是一个16位的十进制数值，所以简单的法则就是，JavaScript 对15位的十进制数都可以精确处理。
Math.pow(2, 53)
// 9007199254740992
Math.pow(2, 53) + 1
// 9007199254740992
Math.pow(2, 53) + 2
// 9007199254740994
Math.pow(2, 53)
// 9007199254740992
// 多出的三个有效数字，将无法保存
9007199254740992111
// 9007199254740992000
```

##### 3.3 数值范围

> JavaScript 提供`Number`对象的`MAX_VALUE`和`MIN_VALUE`属性，返回可以表示的具体的最大值和最小值

```javascript
Number.MAX_VALUE // 1.7976931348623157e+308
Number.MIN_VALUE // 5e-324
```

##### 3.4 与数值有关的全局方法

```javascript
// (1) parseInt():用于将字符串转化为整数
parseInt('123') // 123

// (2)parseFloat(): 将字符串转为浮点
parseFloat('3.14') // 3.14

// (3) isFinite方法返回一个布尔值，表示某个值是否为正常的数值。
isFinite(Infinity) // false
isFinite(-Infinity) // false
isFinite(NaN) // false
isFinite(undefined) // false
isFinite(null) // true
isFinite(-1) // true

// (4) Number.prototype.toFixed() : 将一个数转化为指定位数的小数
(10.055).toFixed(2) // 10.05
(10.005).toFixed(2) // 10.01 会四舍五入

// (5)Number.prototype.toLocaleString() ： 对数字进行格式化
(123).toLocaleString('zh-Hans-CN', { style: 'currency', currency: 'CNY' })
// "￥123.00"

(123).toLocaleString('de-DE', { style: 'currency', currency: 'EUR' })
// "123,00 €"

(123).toLocaleString('en-US', { style: 'currency', currency: 'USD' })
// "$123.00"

```

#### 4、String类型

##### 4.1 字符集

> JavaScript 使用 Unicode 字符集;
>
> 每个字符在 JavaScript 内部都是以16位（即2个字节）的 UTF-16 格式储存。也就是说，JavaScript 的单位字符长度固定为16位长度，即2个字节。

##### 4.2 字符串的基本操作

```javascript
// 0: 字符串的长度
let str = "hello";
console.log(str.length);

// 1： 遍历字符串
for(let codePoint of 'foo'){
  console.log(codePoint)
}

// 2：模板字符串 :使用 反引号（``），同时支持字符串插值
$('#result').append(`
  There are <b>${basket.count}</b> items
   in your basket, <em>${basket.onSale}</em>
  are on sale!
`);

// 3:  模板编译【待补充】

// 4: 实例方法：includes(), startsWith(), endsWith() 
let s = 'Hello world!';
//使用第二个参数n时，endsWith的行为与其他两个方法有所不同。它针对前n个字符，而其他两个方法针对从第n个位置直到字符串结
s.startsWith('world', 6) // true
s.endsWith('Hello', 5) // true
s.includes('Hello', 6) // false

// 5: 实例方法：repeat()  
'x'.repeat(3) // "xxx"

// 6: 实例方法：padStart()：头部补全，padEnd()：尾部补全
'x'.padStart(5, 'ab') // 'ababx'
'x'.padStart(4, 'ab') // 'abax'

// 7:  截取字符串
var subString = 'Javascript'.slice(0,4);
console.log(subString);
var substr = 'Javascrpt'.substr(0,4);
```

##### 4.3 Base64转码

> 所谓 Base64 就是一种编码方法，可以将任意值转成 0～9、A～Z、a-z、`+`和`/`这64个字符组成的可打印字符。使用它的主要目的，不是为了加密，而是为了不出现特殊字符，简化程序的处理

```javascript
/*
  btoa()：任意值转为 Base64 编码
  atob()：Base64 编码转为原来的值
  
  这两个方法不适合非 ASCII 码的字符，会报错。[例如中文]
*/ 
function b64Encode(str) {
  return btoa(encodeURIComponent(str));
}

function b64Decode(str) {
  return decodeURIComponent(atob(str));
}

b64Encode('你好') // "JUU0JUJEJUEwJUU1JUE1JUJE"
b64Decode('JUU0JUJEJUEwJUU1JUE1JUJE') // "你好"
```

#### 5、Symbol类型

> Symbol是ES6新增的符号类型

```javascript
// (1)基本使用 
let sym  = Symbol();
console.log(typeof sym); // symbol
// (2)使用全局符号注册表
let foolGlobal = Symbol.for('foo');
console.log(typeof foolGlobal); // symbol
// (3)使用符号作为属性
let s1 = Symbol('foo');
let o = {
  [s1]:'foo val'
}

```

### 6、表达式与运算符

#### 6.1 表达式

> 表达式是指能计算出值的任何可用程序单元。
> 表达式是一种JS短语，可使JS解释器用来产生一个值。

##### 6.1.1 表达式

```javascript
// （1）常量、直接量
3.14;
"test";
// （2）关键字
null ;
this;
true;
// （3）变量
i;
k;
j;
// （4）数组、对象的初始化表达式
[1,2];
[1,,,4]; // [1,undefined,undefined,4]
[x:1,y:2];
// （5）函数表达式:普通函数和自动执行函数
var fe = function(){};
(function(){
 console.log('hello world');
})();

// （6）属性访问表达式
var o = {x:1};
o.x;
o['x'];

```

#### 6.2 运算符

##### 6.2.1 一元、二元、三元

```javascript
//基本运算符
+num;
a + b;
c ? a : b;
var val == true ? 1 : 2 ;// 1

// 赋值
x += 1;

// 比较
a == b ;

// 算数
a - b;
// 按位或 |: 二进制“或”(有 1 则为 1)，比如:1010 | 1011 = 1011，1010 | 1000 = 1010  
// 按位与 &: 二进制“与”(有 0 则为 0)，比如:1010 & 1011 = 1010，1010 & 1000 = 1000
a | b ;
// 逻辑与 ：若左侧为false，则不计算右侧
exp1 && exp2;
```

##### 6.2.2 运算符，

```javascript
a,b;
var val = (1,2,3);//val = 3
```

##### 6.2.3 运算符delete

```javascript
var obj = {x:1};
obj.x; // 1
delete obj.x;
obj.x; // undefined

var obj1 = {};
Object.defineProperty(obj1,'x',{
  configurable:false,
  value:1
});
delete obj.x;//false
obj.x;
```

##### 6.2.4 运算符in

> 判断属性是否在对象中，不能不判断是本身属性还是继承属性

```javascript
window.x = 1;
'x' in window;// true
```

##### 6.2.5 相等操作符

> 严格相等运算符（===）比较的是是否为“同一个值”，类型不同直接返回flase；对于复合类型（引用类型），
>
> 比较是否引用的是同一个地址；
>
> 相等运算符（==）比较的是“值是否相等”，类型不同会先转成原始类型，再进行比较

```javascript
 const hasOwn = Object.prototype.hasOwnProperty;

/*
  (1) 使用 == 的问题，会进行类型转换
   0 == ‘’ // true
   null == undefined // true
   [1] == true // true
  (2) 使用全等 === 要求必须类型一致；但也有两个问题
  NaN === NaN // flase ；期待的是true
  +0 === -0 // true ；期待的是false

*/

// 比较基本类型的两个值是否相等
function is(x, y) {
  if (x === y) {
    return x !== 0 || y !== 0 || 1 / x === 1 / y;
  } else {
    // 解决NaN的问题
    return x !== x && y !== y;
  }
}

// React中的工具函数
export default function shallowEqual(objA, objB) {
  // 基本类型做比较
  if (is(objA, objB)) return true;

  if (
    typeof objA !== 'object' ||
    objA === null ||
    typeof objB !== 'object' ||
    objB === null
  ) {
    return false;
  }

  const keysA = Object.keys(objA);
  const keysB = Object.keys(objB);

  if (keysA.length !== keysB.length) return false;

  for (let i = 0; i < keysA.length; i++) {
    if (
      !hasOwn.call(objB, keysA[i]) ||
      !is(objA[keysA[i]], objB[keysA[i]])
    ) {
      return false;
    }
  }

  return true;
}
```

##### 6.2.6 + 运算符

```javascript
//(1) JavaScript中由于 + 运算符的重载导致，导致在运算子不同时产生的结果不一样
var a = 1 + true  // 2
var b = 1 + 'true' // '1true'
var c = '3' + 4 + 5 // '345' 运算顺序从左到右
var d = 3 + 4 + '5' // '75' 

// (2) 除了+运算符以外，其他运算符都不会发生重载

/*
  (3) 对象相加
  运算子为对象，则对象会先自动调用valueOf方法；
  obj.valueOf();// {p:1}
  然后再调用toString();
  obj.valueOf().toString();// [object object]
          */ 
var obj = {p:1}
obj + 2 // "[object object]2"

//(4) 余数运算符 
-1 % 2 // -1
1 % -2 // 1
// 正确的写法
function isOdd(n) {
  return Math.abs(n % 2) === 1;
}
isOdd(-5) // true
isOdd(-4) // false

// (5)指数运算符 [从右向左运算的]
x ** y 

```



### 

### 4、 类型检测

#### 4.1  typeof ： 可以返回一个值的数据类型

```javascript
// 判断基本类型 
typeof 100  // "number"
typeof true // "boolean"
typeof function // "function"
typeof undefined // "undefined"

typeof new Object() // "object"
typeof [1,2] // "object"
typeof NaN // "number"
typeof null // "object"
```

####  4.2 instanceof

> obj instanceof object
> 原理：判断obj这个对象的原型链是否存在object.prototype这个对象

```javascript
// 判断对象类型
[1,2] instanceof Array === true
new Object() instanceof Array === false
```

![屏幕快照 2020-02-20 下午4.32.44.png](https://cdn.nlark.com/yuque/0/2020/png/314538/1582187627238-ffdf948e-3741-46ae-b78a-604af14fcf7b.png?x-oss-process=image%2Fresize%2Cw_746)

#### 4.3 Object.prototype.toString

![屏幕快照 2020-02-20 下午4.48.25.png](https://cdn.nlark.com/yuque/0/2020/png/314538/1582188609953-2beea98b-8258-41d1-8bc3-943bcd5cb942.png?x-oss-process=image%2Fresize%2Cw_746)

#### 4.4 检测类型小结

![屏幕快照 2020-02-20 下午4.59.13.png](https://cdn.nlark.com/yuque/0/2020/png/314538/1582189244913-d3f28354-397f-4f42-90ea-6ed5c7ff7db6.png?x-oss-process=image%2Fresize%2Cw_746)

#### 7.5 练习


```javascript
/*
  请编写arraysSimilar函数，实现判断传入的两个数组是否相似。具体需求：

1. 数组中的成员类型相同，顺序可以不同。例如[1, true] 与 [false, 2]是相似的。

2. 数组的长度一致。

3. 类型的判断范围，需要区分:String, Boolean, Number, undefined, null, 函数，日期, window.

当以上全部满足，则返回"判定结果:通过"，否则返回"判定结果:不通过"。
*/

 /*
         * param1 Array 
         * param2 Array
         * return true or false
         */
        function type(a){
            return  a === null ? '[object Null]':Object.prototype.toString.apply(a); //hack ie678
        }
        function arraysSimilar(arr1, arr2){
            if(!Array.isArray(arr1) || !Array.isArray(arr2) ||arr1.length!=arr2.length){return false;}
            var arr3=[];
            var arr4=[];
            var x;
            for(var i in arr1){
                arr3.push(type(arr1[i]));
                arr4.push(type(arr2[i]));
            }
            if(arr3.sort().toString()==arr4.sort().toString()){
                return true;
            }else{
                return false;
            }
       }
```

