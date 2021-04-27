### Object对象

> JavaScript中的所有对象都继承自Object对象；

#### 1、Object()

> Object本身是一个函数，可以当做工具函数使用，将任意值转化为对象；

```JavaScript
function isObject(value) {
  return value === Object(value);
}

isObject([]) // true
isObject(true) // false
```

#### 2、Object构造函数

> 作为构造函数使用，可以利用new命令创建新对象

#### 3、Object的静态方法

> 静态方法就是部署在Object对象上的方法；

#####  3.1 遍历对象的属性

```javascript
/*
Object.keys(obj),Object.getOwnPropertyNames(obj)
 + 相同点：遍历对象的自身属性
 + 不同点：Object.getOwnPropertyNames()可以遍历出不可枚举的属性，例如：数组的length属性
 */
```

##### 3.2 for...of

> *for* *of* 语句可以遍历所有具有遍历器接口的对象（遍历的是value）

##### 3.3 for...in

> for...in  ：遍历key（原型上的属性名称也会被遍历出来）

##### 3.4 forEach

```javascript
 [1, 2, 3, 4].forEach(function (currentValue, index, arr) {
  return;// return break contiune等都会失效
  console.log(currentValue);
});
```

#### 4、Object的实例方法

##### 4.1 比typeof类型判断更准确的方法

```javascript
 var type = function (o) {
  var s = Object.prototype.toString.call(o);
  return s.match(/\[object (.*?)\]/)[1].toLowerCase();
};
// 准确判断是何种类型
[
  'Null',
  'Undefined',
  'Object',
  'Array',
  'String',
  'Number',
  'Boolean',
  'Function',
  'RegExp',
].forEach(function (t) {
  type['is' + t] = function (o) {
    return type(o) === t.toLowerCase();
  };
});
type.isObject({}); // true
type.isNumber(NaN); // true
type.isRegExp(/abc/); // true
```

##### 4.2 判断实例是否具有某种类型

```javascript
 var obj2 = {
  p: 'p1',
};
console.log(obj2.hasOwnProperty('p'));
```

