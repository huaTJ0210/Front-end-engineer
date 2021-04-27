### 1、Symbol

#### 1.1 Symbol基础

>Symbol表示独一无二的值,让对象的属性除了可以定义为字符串外还可以定义为Symbol，通过Symbol函数生成；

```javascript
//(1)  如何创建

let s = Symbol();
let s1 = Symbol('foo');// 可以接收一个字符串作为实例的描述；如果使用object对象标注，对象会被toString后作为标识
typeof s;// "symbol"
typeof s1; // "Symbol(foo)"

// (2)  Symbol函数的返回值是不相等的

// 没有参数的情况
let s1 = Symbol();
let s2 = Symbol();

s1 === s2 // false

// 有参数的情况
let s1 = Symbol('foo');
let s2 = Symbol('foo');

s1 === s2 // false

// (3) Symbol函数不能与其他类型进行运算;但可以显式的转化
let sym = Symbol('My symbol');

"your symbol is " + sym
// TypeError: can't convert symbol to string
`your symbol is ${sym}`
// TypeError: can't convert symbol to string

let sym = Symbol('My symbol');

String(sym) // 'Symbol(My symbol)'
sym.toString() // 'Symbol(My symbol)'
```

#### 1.2 Symbol 一些方法

```javascript
// (1)Symbol的描述
const sym = Symbol('foo');
sym.description // "foo"

// (2) 作为属性名称：防止被覆盖 
let mySymbol = Symbol();

// 第一种写法
let a = {};
a[mySymbol] = 'Hello!';

// 第二种写法
let a = {
  [mySymbol]: 'Hello!'
};

// 第三种写法
let a = {};
Object.defineProperty(a, mySymbol, { value: 'Hello!' });

// 以上写法都得到同样结果
a[mySymbol] // "Hello!"

// (3) 注意事项：
// 3-1 : ，Symbol 值必须放在方括号之中。
// 3-2 : Symbol 值作为对象属性名时，不能用点运算符，使用点会被当做字符串


// (4) 实际使用案例
// 4-1 : 消除硬编码字符串
const shapeType = {
  triangle: 'Triangle' 
};

function getArea(shape, options) {
  let area = 0;
  switch (shape) {
    case shapeType.triangle:
      area = .5 * options.width * options.height;
      break;
  }
  return area;
}

getArea(shapeType.triangle, { width: 100, height: 100 });
```

#### 1.3 Symbol 实现一个单例【但也不是绝对可靠】

```javascript
// mod.js
const FOO_KEY = Symbol('foo');

function A() {
  this.foo = 'hello';
}

if (!global[FOO_KEY]) {
  global[FOO_KEY] = new A();
}

module.exports = global[FOO_KEY];

/*
 存在的问题：
 上面代码将导致其他脚本都无法引用FOO_KEY。但这样也有一个问题，就是如果多次执行这个脚本，每次得到的FOO_KEY都是不一样的。虽然 Node 会将脚本的执行结果缓存，一般情况下，不会多次执行同一个脚本，但是用户可以手动清除缓存，所以也不是绝对可靠。
*/ 
```

### 2、set和map

#### 2.1 Set

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

#### 2.2 WeakSet

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

#### 2.3 Map

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

#### 2.4 WeakMap

> `WeakMap`结构与`Map`结构类似，也是用于生成键值对的集合。key只能是对象，`WeakMap`的键名所指向的对象，不计入垃圾回收机制。

### 3、Proxy

> Proxy用于修改某些操作的默认行为；
>
> Proxy可以对目标对象进行拦截操作，外界对目标对象的操作都会经过此拦截层；

#### 3.1 拦截get和set请求

```javascript
/*
   var proxy = new Proxy(target, handler);
   1、 target： 代理的目标对象；
   2、 handler：数据类型是一个对象，用来定制拦截行为；
   注意点：
   要使得Proxy代理生效，就必须针对Proxy创建的实例对象进行操作，否则无效
*/ 
let obj = new Proxy({},{
   set:function(target,propKey,value,receiver){
     console.log(`setting:${value}`);
     return Reflect.set(target,propKey,value,receiver);
   },
   get:function(target,propKey,receiver){
        console.log(`getting:${propKey}`);
        return Reflect.get(target,propKey,receiver);
   }
});

obj.foo = 'foo';
obj.foo;
```

#### 3.2 Proxy实例的方法

> Proxy有13种实例方法 

```javascript
var handler = {
  /*
    (1) get(): 用于拦截属性的读取操作
    target :   目标对象
    propKey ： 属性名称
    receiver:  当前执行操作行为的对象
  */ 
  get: function(target, propKey,receiver) {
    if (propKey === 'prototype') {
      return Object.prototype;
    }
    return 'Hello, ' + propKey;
  },
  /*
    (2) set(): 用于拦截属性的赋值操作
  */
  set:function(target,propKey,value,receiver){
     target[propKey] = value * 2;
  }
  /*
    (3) apply():拦截函数的调用、call和apply操作。
      apply方法可以接受三个参数，分别是目标对象、目标对象的上下文对象（this）和目标对象的参数数组。
  */
  apply: function(target, thisBinding, args) {
    return args[0];
  },
  /*
   (4) construct方法用于拦截new命令
  */
  construct: function(target, args) {
    return {value: args[1]};
  }
};

var fproxy = new Proxy(function(x, y) {
  return x + y;
}, handler);

fproxy(1, 2) // 1
new fproxy(1, 2) // {value: 2}
fproxy.prototype === Object.prototype // true
fproxy.foo === "Hello, foo" // true
```

### 4、Reflect

> （1） 将`Object`对象的一些明显属于语言内部的方法（比如`Object.defineProperty`），放到`Reflect`对象上。现阶段，某些方法同时在`Object`和`Reflect`对象上部署，未来的新方法将只部署在`Reflect`对象上。也就是说，从`Reflect`对象上可以拿到语言内部的方法。
>
> （2） 修改某些`Object`方法的返回结果，让其变得更合理。比如，`Object.defineProperty(obj, name, desc)`在无法定义属性时，会抛出一个错误，而`Reflect.defineProperty(obj, name, desc)`则会返回`false`。
>
> （3） 让`Object`操作都变成函数行为。某些`Object`操作是命令式，比如`name in obj`和`delete obj[name]`，而`Reflect.has(obj, name)`和`Reflect.deleteProperty(obj, name)`让它们变成了函数行为。
>
> （4）`Reflect`对象的方法与`Proxy`对象的方法一一对应，只要是`Proxy`对象的方法，就能在`Reflect`对象上找到对应的方法。这就让`Proxy`对象可以方便地调用对应的`Reflect`方法，完成默认行为，作为修改行为的基础。也就是说，不管`Proxy`怎么修改默认行为，你总可以在`Reflect`上获取默认行为。
>
> 

### 5、Promise

> 允诺将来会将获取的结果返回，例如异步的网络请求，延迟业务处理的结果等；
> 在异步执行的流程中，将执行代码和处理结果的代码清晰分离

#### 5.1 Promise的基本使用

> 实例代码中创建的Promise对象接收一个函数作为参数，函数有两个参数分别为resolve:执行结果成功后的回调函数，reject；执行的结果失败后的回调函数；

```javascript
getRandomNumber(){
       return new Promise((resolve,reject)=>{
            var timeOut = Math.random()*2;
            setTimeout(()=>{
                if(timeOut < 1){
                    resolve('200 ok'); // resolve:将Promise的状态由pending变成fulfilled
                }else{
                    reject('timeout in' + timeOut + 's');// reject:将Promise的状态由pending变成rejected
                }
            },1000);
        });
    }
```


> 在具体调用getRandomNumber()时，then中传入的匿名函数相当于resolve，catch中传入的匿名函数相当于reject；

```javascript
  this.getRandomNumber().
   then((text)=>{
       Alert.alert(text);
   }).catch((error)=>{
    Alert.alert(error);
   });
```

##### 5.1.1 Promise对象新创建后会立即的执行

```javascript
// (1) Promise对象新创建后会立即的执行,传递的函数内部的同步任务
let promise = new Promise((resolve,reject)=>{
     console.log('===>:1');
     resolve('2');
 });
 promise.then((data)=>{
     console.log('===>:'+ data);
 });
 console.log('===>:3');
 /*
   ===>:1  创建的Promise对象内部逻辑会立即执行；
   ===>:3  在resolve/reject前先执行
   ===>:2  触发Promise内部状态改变的resolve/reject，会在后续的所有同步任务操作执行完毕后再执行
*/

//(2) 注意，调用resolve或reject并不会终结 Promise 的参数函数的执行。
new Promise((resolve, reject) => {
  resolve(1);
  console.log(2);
}).then(r => {
  console.log(r);
});
// 2 
// 1
// 以上结果的原因： 因为立即 resolved 的 Promise 是在本轮事件循环的末尾执行，总是晚于本轮循环的同步任务。
```

##### 5.1.2 当异步操作的结果返回另外一个异步操作

```javascript
const p1 = new Promise((resolve,reject)=>{
  // 3秒之后返回一个错误
   setTimeout(()=>{reject(new Error('fail'))},3000);
});

const p2 = new Promise((resolve,reject)=>{
  setTimeout(()=>resolve(p1),1000); //  由于p2的resolve返回的是p1，此时p2的状态无效，需要等到p1最终的执行状态
  });
p2.then((result)=>{
   console.log(result);
}).catch((error)=>{
  console.log(error); // 最终的执行结果为：Error：fail
})
```

##### 5.1.3 Promise内部的错误不会传递到代码外层

```javascript
const someAsyncThing = function() {
  return new Promise(function(resolve, reject) {
    // 下面一行会报错，因为x没有声明
    resolve(x + 2);
  });
};

someAsyncThing().then(function() {
  console.log('everything is great');
});

setTimeout(() => { console.log(123) }, 2000);
// Uncaught (in promise) ReferenceError: x is not defined
// 123   : Promise 内部的错误不会影响到 Promise 外部的代码，通俗的说法就是“Promise 会吃掉错误”。
```

#### 5.2 处理两个异步动作有先后顺序的情况

> 先执行multiply操作，获取的结果再执行add操作

```javascript
  multiply(input){
      return new Promise((resolve,reject)=>{
           setTimeout(resolve,1000,input * input);
      });
  } 

  add(input){
      return new Promise((resolve,reject)=>{
          setTimeout(resolve,2000,input + input);
      });
  }

  var p = new Promise((resolve,reject)=>{
     resolve(1);
 });
 p.then(this.multiply).then(this.add).then((text)=>{
     Alert.alert(String(text));
 });
```

#### 5.3 all/race

```javascript
  var p1 = new Promise((reslove,reject)=>{
       setTimeout(reslove,3000,'p1');
   });
   var p2 = new Promise((resolve,reject)=>{
       setTimeout(resolve,4000,'p2');
   });

 /*
    (1) Promise.all(): 
     1-1 ： p1和p2都为fulfilled时，才执行resolve函数；
     1-2 ： 如果p1和p2中有一个为rejected，则执行reject函数
 */ 
   Promise.all([p1,p2]).then((result)=>{
       console.log(result.toString());
   }).catch((error)=>{
       console.log(error);
   });  
   
   /*
     （2）多个异步任务为了容错，可以同时发送两个任务，后返回结果的任务将会被丢弃
      根据p1、p2中最新改变状态的； 
   */ 
   Promise.race([p1,p2]).then((result)=>{
      console.log(result.toString());
   });
```

#### 5.4 Promise.allSettled()

> 等待组合起来的所有Promise执行完毕后，汇总结果，然后返回

```javascript
const promises = [ fetch('index.html'), fetch('https://does-not-exist/') ];
// 汇总的结果
const results = await Promise.allSettled(promises);
// 过滤出成功的请求
const successfulPromises = results.filter(p => p.status === 'fulfilled');

// 过滤出失败的请求，并输出原因
const errors = results.filter(p => p.status === 'rejected').map(p => p.reason);

```

### 6、async函数

#### 6.1 基本用法

```javascript
async function getStockPriceByName(name) {
  const symbol = await getStockSymbol(name);
  const stockPrice = await getStockPrice(symbol);
  return stockPrice;
}

getStockPriceByName('goog').then(function (result) {
  console.log(result);
});
```

#### 6.2按照顺序执行异步操作

```javascript
// (1) : 问题是所有远程操作都是继发。只有前一个 URL 返回结果，才会去读取下一个 URL，这样做效率很差
async function logInOrder(urls) {
  for (const url of urls) {
    const response = await fetch(url);
    console.log(await response.text());
  }
}

// (2)map方法的参数是async函数，但它是并发执行的，因为只有async函数内部是继发执行，外部不受影响。后面的for..of循环内部使用了await，因此实现了按顺序输出
async function logInOrder(urls) {
  // 并发读取远程URL
  const textPromises = urls.map(
    async url => {
      const response = await fetch(url);
      return response.text();
    }
  );

  // 按次序输出
  for (const textPromise of textPromises) {
    console.log(await textPromise);
  }
}
```

#### 6.3 使用注意点

```javascript
// (1) : await后面的Promise对象运行结果可能是rejected，所以最好吧await放在try...catch中
async function myFunction() {
  try {
    await somethingThatReturnsAPromise();
  } catch (err) {
    console.log(err);
  }
}

// 另一种写法
async function myFunction() {
  await somethingThatReturnsAPromise()
  .catch(function (err) {
    console.log(err);
  });
}

// (2) : 多个await命令后面的异步操作，如果不存在继发关系，最好让它们同时触发。

// (2) - 1 : 以下两种操作，不存在继发关系，如果这样写会比较的耗时
let foo = await getFoo();  
let bar = await getBar(); 
// 修改成下面的方式：
// 写法一
let [foo, bar] = await Promise.all([getFoo(), getBar()]);

// 写法二
let fooPromise = getFoo();
let barPromise = getBar();
let foo = await fooPromise;
let bar = await barPromise;
```

