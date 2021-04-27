

## 1、数组
### 1.1 创建数组、数组操作
#### 1.1.1 数组概述
> 数组是值的有序集合；每个值叫做元素；每个元素在数组中的位置编号叫做索引；
> JS数组是弱类型的因此他可以存储不同类型的数据；

```javascript
var arr = [1,true,null,undefined,{x:1},[1,2,3]];
```
#### 1.1.2 创建数组-字面量
```javascript
var bat = ['alibaba','tencent','baidu'];
var arrInt = [[1,2],[3,4,5]];
var commasArr1 = [1,,2];// 1,undefined,2
```
#### 1.1.3 创建数组-new Array
> new 关键字可以省略

```javascript
// 使用构造函数进行创建
var arr = new Array();
var arrWithLength = new Array(10);
```
#### 1.1.4 数组-元素读写
```javascript
var arr = [1,2,3,4,5];
arr[1];//2
arr.length;//5
```
#### 1.1.5 数组-元素增删
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
#### 1.1.6 数组-迭代
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
#### 1.1.7 数组-类数组对象

> 如果一个对象的所有键名都是正整数或零，并且有`length`属性语法上称之为“类数组对象”

```javascript
var obj = {
  0: 'a',
  1: 'b',
  2: 'c',
  length: 3
};
```

### 1.2 数组方法

#### 1.2.1 Array.prototype.join
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
#### 1.2.2 Array.prototype.reverse
```javascript
var arr = [1,2,3];
arr.reverse();
arr;// [3,2,1]  会对原数组进行更改
```
#### 1.2.3 Array.prototype.sort
```javascript
var arr = ["a","d","c","b"];
arr.sort();
arr;// ["a","b","c","d"] 默认根据字母顺序排列

arr = [13,24,51,3];
arr.sort(function(a,b){
  return a - b； // 负数按照从小到大顺序排列
});
```
#### 1.2.4 Array.prototype.concat
```javascript
var arr = [1,2,3];
arr.concat(4,5);// 返回新数组：[1,2,3,4,5];
arr;// [1,2,3]

```
#### 1.2.5 Array.prototype.slice
> 不会对原数组进行修改，返回一个新的数组

```javascript
var arr = [1,2,3,4,5];
arr.slice(1,3);//[2,3]
arr.slice(1);//[2,3,4,5]
arr.slice(1,-1);//[2,3,4]  -1：代表从尾部开始计数
```
#### 1.2.4 Array.prototype.splice
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
#### 1.2.4 Array.prototype.forEach
> 数组迭代

```javascript
var arr = [1,2,3,4,5];
arr.forEach(function(x,index,a){
  // x : 当前遍历元素，index：索引 a：当前数组
  console.log(x + '|' + index );
});
```
#### 1.2.5 Array.prototype.map
> 数组映射：对数组中的每一个元素进行操作，不改变原数组

```javascript
var arr = [1,2,3];
var newArr = arr.map(function(x){
  return x + 10;
}); // [11,12,13]
arr;//[1,2,3]
```
#### 1.2.5 Array.prototype.filter
> 数组过滤：对数组中的每一个元素进行过滤，筛选符合条件的元素，不改变原数组

```javascript
var arr = [1,2,3,4,5,6,7,8,9,10];
var newArr = arr.filter(function(x,index){
   return index % 3 === 0 || x >= 8 ;
});// [1,4,7,8,9,10]
arr; // 原数组不变
```
#### 1.2.6 Array.prototype.every & some
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
#### 1.2.7 Array.prototype.reduce & reduceRight
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
#### 1.2.8 Array.isArray
```javascript
 Array.isArray([]);
[] instanceof Array
```