

### 数据类型

#### 1、 数据类型概述

##### 1.1 原始类型

1. 数值（number）：整数和小数（比如`1`和`3.14`）

   > JavaScript 内部，所有数字都是以64位浮点数形式储存，即使整数也是如此。所以，`1`与`1.0`是相同的，是同一个数。

2. 字符串（string）：文本（比如 'Hello World'）

3. 布尔值（boolean）：true和false

   ```javascript
   /*
   如果预期位置上时布尔值，以下6种类型会自动转为false
   
   undefined
   null
   false
   0
   NaN
   ""或''（空字符串）
   
   */
   ```


##### 1.2 特殊类型

1. null ：表示是一个表示“空”的对象，转为数值时为0；

   > null使用场景：
   >
   > null`表示空值，即该处的值现在为空。调用函数时，某个参数未设置任何值，这时就可以传入`null`，表示该参数为空。`
   >
   > 比如，某个函数接受引擎抛出的错误作为参数，如果运行过程中未出错，那么这个参数就会传入`null`，表示未发生错误；
   >
   > 【解析网络请求数据时，会出现null的情况】

2. undefined ： 是一个表示"此处无定义"的原始值，转为数值时为NaN

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

3. null和undefined含义差不多，为什么要设置两个这样的值？

   > JavaScript的诞生之初，借鉴java只设置了null表示“无”；但是null转数字时，会自动变0；
   >
   > 设计者表示如果null自动转为0，很不容易发现错误，就又设计了undefined，表示“此处无定义”的原始值，转为数字为NaN

##### 1.3 合成类型

1. object : [Function、Array、Date等]各种值组成的集合

   

#### 2、数值

##### 2.1 整数和浮点数

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

##### 2.2 数值精度

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

##### 2.3 数值范围

> JavaScript 提供`Number`对象的`MAX_VALUE`和`MIN_VALUE`属性，返回可以表示的具体的最大值和最小值

```javascript
Number.MAX_VALUE // 1.7976931348623157e+308
Number.MIN_VALUE // 5e-324
```

##### 2.4 与数值有关的全局方法

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
```

#### 3、字符串

##### 3.1 字符集

> JavaScript 使用 Unicode 字符集;
>
> 每个字符在 JavaScript 内部都是以16位（即2个字节）的 UTF-16 格式储存。也就是说，JavaScript 的单位字符长度固定为16位长度，即2个字节。

##### 3.2 Base64转码

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
