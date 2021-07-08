# 集合数据类型

## 1、数组

### 1 创建数组、数组操作

#### 1.1 数组概述

> 数组是值的有序集合；每个值叫做元素；每个元素在数组中的位置编号叫做索引；
> JS数组是弱类型的因此他可以存储不同类型的数据；

```javascript
var arr = [1,true,null,undefined,{x:1},[1,2,3]];
```

#### 1.2 创建数组-字面量

```javascript
var bat = ['alibaba','tencent','baidu'];
var arrInt = [[1,2],[3,4,5]];
var commasArr1 = [1,,2];// 1,undefined,2
```

#### 1.3 创建数组-new Array

> new 关键字可以省略

```javascript
// 使用构造函数进行创建
var arr = new Array();
var arrWithLength = new Array(10);
```

#### 1.4 数组-元素读写

```javascript
var arr = [1,2,3,4,5];
arr[1];//2
arr.length;//5
```

#### 1.5 数组-元素增删

```javascript
var arr = [];
arr[0] = 1;
arr[1] = 2;
arr.push(3); // 向数组末尾增加元素
arr;// [1,2,3]
arr.unshift(0);//向数组头部增加元素
arr；// [0,1,2,3];

arr.pop();// 将数组末尾元素移除
arr.shift();// 将数组头部元素移除
```

#### 1.6 数组-迭代

```javascript
var i = 0,n=10;
var arr = [1,2,3,4,5];
for(;i<n;i++){
 console.log(arr[i]);
}

for(i in arr){
  console.log(i);
}
// 为了避免for...in将Array原型链上的元素遍历出来
for(i in arr){
  if(arr.hasOwnProperty(i)){
    console.log(i);
  }
}
```

#### 1.7 数组-类数组对象

> 如果一个对象的所有键名都是正整数或零，并且有`length`属性语法上称之为“类数组对象”

```javascript
var obj = {
  0: 'a',
  1: 'b',
  2: 'c',
  length: 3
};
```

### 2 数组方法

#### 2.1 Array.prototype.join

```javascript
var arr = [1,2,3];
arr.join(); //"1,2,3"
arr.join('_');//"1_2_3"
// 重复字符串的生成
function reapeatString(str,n){
  return new Array(n+1).join(str);
}

reapeatString("a",3);// "aaa"
```

#### 2.2 Array.prototype.reverse

```javascript
var arr = [1,2,3];
arr.reverse();
arr;// [3,2,1]  会对原数组进行更改
```

#### 2.3 Array.prototype.sort

```javascript
var arr = ["a","d","c","b"];
arr.sort();
arr;// ["a","b","c","d"] 默认根据字母顺序排列

arr = [13,24,51,3];
arr.sort(function(a,b){
  return a - b； // 负数按照从小到大顺序排列
});
```

#### 2.4 Array.prototype.concat

```javascript
var arr = [1,2,3];
arr.concat(4,5);// 返回新数组：[1,2,3,4,5];
arr;// [1,2,3]

```

#### 2.5 Array.prototype.slice

> 不会对原数组进行修改，返回一个新的数组

```javascript
var arr = [1,2,3,4,5];
arr.slice(1,3);//[2,3]
arr.slice(1);//[2,3,4,5]
arr.slice(1,-1);//[2,3,4]  -1：代表从尾部开始计数
```

#### 2.6 Array.prototype.splice

> 原数组也会修改，返回一个新的数组

```javascript
var arr = [1,2,3,4,5];
arr.splice(2);// return [3,4,5]
arr;// [1,2]

arr = [1,2,3,4,5];
arr.splice(2,2);// return [3,4]
arr;//[1,2,5]

arr = [1,2,3,4,5];
arr.splice(1,1,'a','b'); // return [2]
arr;// [1,'a','b',3,4,5]
```

#### 2.7 Array.prototype.forEach

> 数组迭代

```javascript
var arr = [1,2,3,4,5];
arr.forEach(function(x,index,a){
  // x : 当前遍历元素，index：索引 a：当前数组
  console.log(x + '|' + index );
});
```

#### 2.8 Array.prototype.map

> 数组映射：对数组中的每一个元素进行操作，不改变原数组

```javascript
var arr = [1,2,3];
var newArr = arr.map(function(x){
  return x + 10;
}); // [11,12,13]
arr;//[1,2,3]
```

#### 2.9 Array.prototype.filter

> 数组过滤：对数组中的每一个元素进行过滤，筛选符合条件的元素，不改变原数组

```javascript
var arr = [1,2,3,4,5,6,7,8,9,10];
var newArr = arr.filter(function(x,index){
   return index % 3 === 0 || x >= 8 ;
});// [1,4,7,8,9,10]
arr; // 原数组不变
```

#### 2.10 Array.prototype.every & some

> 对数组整体进行判断；
> every: 数组中的元素全部符合条件则返回true；
> some：数组中的元素只要有符合条件的就返回true

```javascript
var arr = [1,2,3,4,5];
arr.every(function(x){
  return x < 10;
});// true
arr.every(function(x){
  return x < 3;
});// false

arr.some(function(x){
  return x === 3;
}); // true

arr.some(function(x){
   return x > 10 ;
}); // flase
```

#### 2.11 Array.prototype.reduce & reduceRight

> 对数组中的元素两两进行操作；把整个数组聚合成一个结果
>
> #### reduceRight:执行顺序从右侧开始

```javascript
var arr = [1,2,3];

// 可以设置初始位置第一个参数
var sum = arr.reduce(function(x,y){
  return x + y;
},0); // 6

```

#### 2.12 Array.isArray

```javascript
 Array.isArray([]);
[] instanceof Array
```

### 3、Array新增方法

#### 3.1 扩展运算符

> 扩展运算符

```javascript
// 将数组变成参数序列
console.log(...[1,2,3]);// 1,2,3

function push(array,...items){
  array.push(...items)
}
```

#### 3.2  替换函数的apply方法

```javascript
// ES5 的写法
function f(x, y, z) {
  // ...
}
var args = [0, 1, 2];
f.apply(null, args);

// ES6的写法
function f(x, y, z) {
  // ...
}
let args = [0, 1, 2];
f(...args);

// ES5 的写法
Math.max.apply(null, [14, 3, 77])

// ES6 的写法
Math.max(...[14, 3, 77])

// 等同于
Math.max(14, 3, 77);


```

#### 3.3 扩展运算符的应用

```javascript
// (1) --  复制数组 --
const a1 = [1,2]
const a2 = a1;
a2[0] = 2;
a1;// [2,2] ; a2并未深拷贝a1，只是a1，a2指针指向的是同一个内存地址，所以修改a2的值，a1也会发生变化

// ES5中通过以下方式进行深拷贝
const a1 = [1,2];
const a2 = a1.concat(); 
a2[0] = 2;
a1;// [1,2] ; 
// ES6中通过以下方式进行深拷贝
const a1 = [1,2];
const a2 = [...a1]; // 创建了一个新的数组a2


// (2) --  合并数组 -- 【以下两种方式都是浅拷贝，新数组中的元素都是对原数组的引用】
const arr1 = ['a', 'b'];
const arr2 = ['c'];
const arr3 = ['d', 'e'];

// ES5 的合并数组
arr1.concat(arr2, arr3);
// [ 'a', 'b', 'c', 'd', 'e' ]

// ES6 的合并数组
[...arr1, ...arr2, ...arr3]
// [ 'a', 'b', 'c', 'd', 'e' ]
```

#### 3.4  Array.from

```javascript
// Array.from方法用于将两类对象转为真正的数组
let arrayLike = {
    '0': 'a',
    '1': 'b',
    '2': 'c',
    length: 3
};

// ES5的写法
var arr1 = [].slice.call(arrayLike); // ['a', 'b', 'c']

// ES6的写法
let arr2 = Array.from(arrayLike); // ['a', 'b', 'c']


// NodeList对象
let ps = document.querySelectorAll('p');
Array.from(ps).filter(p => {
  return p.textContent.length > 100;
});

// arguments对象
function foo() {
  var args = Array.from(arguments);
  // ...
}

```

#### 3.5 Array.of

```javascript
// Array.of方法用于将一组值，转换为数组。Array.of基本上可以用来替代Array()或new Array()，并且不存在由于参数不同而导致的重载
Array.of(3, 11, 8) // [3,11,8]
Array.of(3) // [3]
Array.of(3).length // 1

```

#### 3.6 find()和findIndex()

```javascript
// 下面代码中，find方法的回调函数可以接受三个参数，依次为当前的值、当前的位置和原数组。
[1, 5, 10, 15].find(function(value, index, arr) {
  return value > 9;
}) // 10

// findIndex() 返回符合条件的第一个成员的位置，如没有则返回：-1
```

#### 3.7 fill 

```javascript
// 用给定的值填充数组
['a', 'b', 'c'].fill(7)
// [7, 7, 7]

new Array(3).fill(7)
// [7, 7, 7]
```

#### 3.8  数组实例的 entries()，keys() 和 values() 

```javascript
for (let index of ['a', 'b'].keys()) {
  console.log(index);
}
// 0
// 1

for (let elem of ['a', 'b'].values()) {
  console.log(elem);
}
// 'a'
// 'b'

for (let [index, elem] of ['a', 'b'].entries()) {
  console.log(index, elem);
}
// 0 "a"
// 1 "b"
```

#### 3.9数组实例的 includes()

```javascript
[1, 2, 3].includes(2)     // true
[1, 2, 3].includes(4)     // false
[1, 2, NaN].includes(NaN) // true
```

#### 3.10  数组实例的 flat()，flatMap()

```javascript
[1, 2, [3, [4, 5]]].flat()
// [1, 2, 3, [4, 5]]

[1, 2, [3, [4, 5]]].flat(2)
// [1, 2, 3, 4, 5]
```

#### 3.11  数组空位

> 数组的空位指，数组的某一个位置没有任何值。比如，`Array`构造函数返回的数组都是空位。

```javascript
//  空位不是undefined，一个位置的值等于undefined，依然是有值的。空位是没有任何值，in运算符可以说明这一点。
0 in [undefined, undefined, undefined] // true
0 in [, , ,] // false
```



## 4、set和map

#### 4.1 Set

```javascript
// (1) 基本使用
const s = new Set();
[2,3,3,4,5].forEach(x=>s.add(x));  // 通过add方法增加成员
for(let i of s){
  console.log(i);// 2,3,4,5
}

// (2) 使用数组创建set
const set = new Set([1,2,2,4,5]); // 间接的进行了数组的去重操作
[...set];// [1,2,4,5]
set.size;// 4 :获取set成员的个数
[...new Set('ababbc')].join('');// 去除字符串中重复的字符

// (3)set的属性和方法
let s = new Set();
s.add(1).add(2).add(2);// 注意2被加入了两次
s.size // 2
s.has(1) // true
s.has(2) // true
s.has(3) // false
s.delete(2);
s.has(2) // false

// (4) Array.from 把Set结构转为数组
const items = new Set([1, 2, 3, 4, 5]);
const array = Array.from(items);

// (5) 遍历操作
let set = new Set(['red', 'green', 'blue']);

for (let item of set.keys()) {
  console.log(item);
}
// red
// green
// blue

for (let item of set.values()) {
  console.log(item);
}
// red
// green
// blue

for (let item of set.entries()) {
  console.log(item);
}
// ["red", "red"]
// ["green", "green"]
// ["blue", "blue"]

```

#### 4.2 WeakSet

> WeakSet 结构与 Set 类似，也是不重复的值的集合。但是，它与 Set 有两个区别。首先，WeakSet 的成员只能是对象，而不能是其他类型的值;WeakSet 中的对象都是弱引用

```javascript
// （1）基本使用及注意事项
const a = [[1, 2], [3, 4]];
const ws = new WeakSet(a);
// WeakSet {[1, 2], [3, 4]}
const b = [3, 4];
const ws = new WeakSet(b);
// Uncaught TypeError: Invalid value used in weak set(…)

// (2) 基本使用示例
const foos = new WeakSet()
class Foo {
  constructor() {
    foos.add(this)
  }
  method () {
    if (!foos.has(this)) {
      throw new TypeError('Foo.prototype.method 只能在Foo的实例上调用！');
    }
  }
}
```

#### 4.3 Map

```JavaScript
// (1) 基本使用
const m = new Map();
const o = {p: 'Hello World'};

m.set(o, 'content')
m.get(o) // "content"

m.has(o) // true
m.delete(o) // true
m.has(o) // false

// (2) 接收特殊数组
const map = new Map([
  ['name', '张三'],
  ['title', 'Author']
]);

map.size // 2
map.has('name') // true
map.get('name') // "张三"
map.has('title') // true
map.get('title') // "Author"

// (3) 基本方法
const map = new Map();
map.set('foo', true);
map.set('bar', false);
m.get('foo');// true 
map.size // 2
map.has('foo');// true
map.delete('foo');
map.clear(); //  清除所有的成员


// (4) 遍历方法
const map = new Map([
  ['F', 'no'],
  ['T',  'yes'],
]);

for (let key of map.keys()) {
  console.log(key);
}
// "F"
// "T"

for (let value of map.values()) {
  console.log(value);
}
// "no"
// "yes"

for (let item of map.entries()) {
  console.log(item[0], item[1]);
}
// "F" "no"
// "T" "yes"

// 或者
for (let [key, value] of map.entries()) {
  console.log(key, value);
}
// "F" "no"
// "T" "yes"

// 等同于使用map.entries()
for (let [key, value] of map) {
  console.log(key, value);
}
// "F" "no"
// "T" "yes"

// (5) 数组的map方法、filter方法，可以实现 Map 的遍历和过滤（Map 本身没有map和filter方法
const map0 = new Map()
  .set(1, 'a')
  .set(2, 'b')
  .set(3, 'c');

const map1 = new Map(
  [...map0].filter(([k, v]) => k < 3)
);
// 产生 Map 结构 {1 => 'a', 2 => 'b'}

const map2 = new Map(
  [...map0].map(([k, v]) => [k * 2, '_' + v])
    );
// 产生 Map 结构 {2 => '_a', 4 => '_b', 6 => '_c'}

```

#### 4.4 WeakMap

> `WeakMap`结构与`Map`结构类似，也是用于生成键值对的集合。key只能是对象，`WeakMap`的键名所指向的对象，不计入垃圾回收机制。
