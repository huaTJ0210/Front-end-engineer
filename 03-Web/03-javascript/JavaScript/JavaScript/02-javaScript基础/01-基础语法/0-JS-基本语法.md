

### 1、JavaScript语言概述

> + 脚本语言（script language）：不具备开发操作系统的能力，用来编写控制应用程序（浏览器）的脚本；
>
> + 嵌入式语言：依附于宿主环境（浏览器、服务器：Node），调用宿主环境提供的API；
>
> + JavaScript不是纯粹的面向对象编程语言，同时支持其他编程范式（函数式编程）
> + 操控浏览器的能力、Node、数据库操作、移动平台开发、跨平台的桌面应用

###  2、基本语法

#### 2.1 语句

> 语句（statement）是为了完成某种任务而进行的操作;

```javascript
// （0） 赋值语句
var a = 1 + 3 ; 
var b = 'abc';

// (1) if-else结构
if (m === 3) {
  m += 1;
}else{
  m -= 1;
}

// (2)switch结构
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

#### 2.2 变量

> 变量就是为”值“起名，然后引用这个名字

```javascript
  var a = 1;
	var b;// 只声明未赋值，则该变量的值为undefined
	c;// 未声明直接使用： ReferenceError： x is not defined 
```

> 【变量提升】
>
> JavaScript 引擎的工作方式是，先解析代码，获取所有被声明的变量，然后再一行一行地运行。
>
> 这造成的结果，就是所有的变量的声明语句，都会被提升到代码的头部，这就叫做变量提升（hoisting）。

```javascript
console.log(a);// undefined 
var	a = 1;

// 上述代码等价
var a;
console.log(a);
a = 1; // 由于变量的提升导致了a的声明被提前了
```

#### 2.3 标识符

> 标识符（identifier）指的是用来识别各种值的合法名称;
>
> 标识符有一套命名规则，不符合规则的就是非法标识符。JavaScript 引擎遇到非法标识符，就会报错

#### 2.4 区块

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

### 3、表达式与运算符

#### 3.1 表达式

> 表达式是指能计算出值的任何可用程序单元。
> 表达式是一种JS短语，可使JS解释器用来产生一个值。

##### 3.1.1 表达式

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

#### 3.2 运算符

##### 3.2.1 一元、二元、三元

```javascript
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

##### 3.2.2 运算符，

```javascript
a,b;
var val = (1,2,3);//val = 3
```

##### 3.2.3 运算符delete

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

##### 3.2.4 运算符in

> 判断属性是否在对象中，不能不判断是本身属性还是继承属性

```javascript
window.x = 1;
'x' in window;// true
```

##### 3.2.5 运算符instanceof /typeof

```javascript
{} instanceof Object
typeof 100 === 'number'
```

##### 3.2.6 运算符new

```javascript
function Foo(){}
Foo.prototype.x = 1;
var obj = new Foo();
obj.x;//1
obj.hasOwnProperty('x');//false
obj.__proto__.hasOwnProperty('x');// true
```

##### 3.2.7 运算符this

```javascript
this;//window(浏览器)
var obj = {
  func:function(){
    return this;
  }
};
obj.func();//obj
```



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

