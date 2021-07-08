### Object的方法

##### 1.4.1 比typeof类型判断更准确的方法

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

##### 1.4.2 属性的简洁表示法

```javascript
// （1） 创建对象使用简洁语法
let birth = '2000/01/01';

const Person = {
  name: '张三',
  //等同于birth: birth
  birth,
  // 等同于hello: function ()...
  hello() { console.log('我的名字是', this.name); }
};

// (2) 属性的setter和getter也是采用简洁语法
const cart = {
  _wheels: 4,

  get wheels () {
    return this._wheels;
  },

  set wheels (value) {
    if (value < this._wheels) {
      throw new Error('数值太小了！');
    }
    this._wheels = value;
  }
}

// (3) 简写的对象方法不能用作构造函数，会报错。
const obj = {
  f() {
    this.foo = 'bar';
  }
};

new obj.f() // 报错
```

##### 1.4.3 属性的可枚举性和遍历

> 对象的每个属性都有一个描述对象（Descriptor），用来控制该属性的行为。`Object.getOwnPropertyDescriptor`方法可以获取该属性的描述对象。

```javascript
let obj = { foo: 123 };
Object.getOwnPropertyDescriptor(obj, 'foo')
//  {
//    value: 123,
//    writable: true,
//    enumerable: true,
//    configurable: true
//  }
```

> 属性的遍历有以下5种方式

```javascript
（1）for...in

for...in循环遍历对象自身的和继承的可枚举属性（不含 Symbol 属性）。

（2）Object.keys(obj)

Object.keys返回一个数组，包括对象自身的（不含继承的）所有可枚举属性（不含 Symbol 属性）的键名。

（3）Object.getOwnPropertyNames(obj)

Object.getOwnPropertyNames返回一个数组，包含对象自身的所有属性（不含 Symbol 属性，但是包括不可枚举属性）的键名。

（4）Object.getOwnPropertySymbols(obj)

Object.getOwnPropertySymbols返回一个数组，包含对象自身的所有 Symbol 属性的键名。

（5）Reflect.ownKeys(obj)

Reflect.ownKeys返回一个数组，包含对象自身的（不含继承的）所有键名，不管键名是 Symbol 或字符串，也不管是否可枚举。
```

##### 1.4.4 对象的扩展运算符

```javascript
// (1) 解构赋值
let { x, y, ...z } = { x: 1, y: 2, a: 3, b: 4 };
x // 1
y // 2
z // { a: 3, b: 4 }

// (2) 解构赋值要求右侧是一个对象，如果是undefined或者是null则会报运行时错误
let { ...z } = null; // 运行时错误
let { ...z } = undefined; // 运行时错误

// (3) 解构赋值必须是最后一个参数
let { ...x, y, z } = someObject; // 句法错误
let { x, ...y, ...z } = someObject; // 句法错误
```

>  解构赋值的注意事项

```javascript
// (1) 解构赋值是浅拷贝
let obj = { a: { b: 1 } };
let { ...x } = obj;
obj.a.b = 2;
x.a.b // 2

// (2) 解构赋值不能继承原型对象上的属性
let o1 = { a: 1 };
let o2 = { b: 2 };
o2.__proto__ = o1;
let { ...o3 } = o2;
o3 // { b: 2 }
o3.a // undefined
```

##### 1.4.5 对象克隆的方法 【待验证】

> 包含克隆原型对象上的方法

```javascript
// 写法一 ： 部分浏览器可能不兼容
const clone1 = {
  __proto__: Object.getPrototypeOf(obj),
  ...obj
};

// 写法二
const clone2 = Object.assign(
  Object.create(Object.getPrototypeOf(obj)),
  obj
);

// 写法三
const clone3 = Object.create(
  Object.getPrototypeOf(obj),
  Object.getOwnPropertyDescriptors(obj)
)
```

##### 1.4.6 链判断运算符

> 实际编程中读取每一个对象的属性，往往要判断该对象是否存在

```javascript
// 错误的写法
const  firstName = message.body.user.firstName;

// 正确的写法
const firstName = (message
  && message.body
  && message.body.user
  && message.body.user.firstName) || 'default';

// 为了简化ES2020 引入了“链判断运算符”（optional chaining operator）?.，简化上面的写法。
const firstName = message?.body?.user?.firstName || 'default';
```

##### 1.4.7 Null判断运算符

> 读取对象属性的时候，如果某个属性的值是`null`或`undefined`，有时候需要为它们指定默认值。常见做法是通过`||`运算符指定默认值

```javascript
const headerText = response.settings.headerText || 'Hello, world!';
const animationDuration = response.settings.animationDuration || 300;
const showSplashScreen = response.settings.showSplashScreen || true;
// 上述写法的问题在于：属性的值如果为空字符串或false或0，默认值也会生效

// 为了解决这一问题：ES2020 引入了一个新的 Null 判断运算符??。它的行为类似||，但是只有运算符左侧的值为null或undefined时，才会返回右侧的值
const headerText = response.settings.headerText ?? 'Hello, world!';
const animationDuration = response.settings.animationDuration ?? 300;
const showSplashScreen = response.settings.showSplashScreen ?? true;
```

##### 1.4.8 Object.is()

> 用来比较两个值是否严格相等

```javascript
Object.is('foo', 'foo')// true
Object.is({}, {})// false

// === 的缺点
+0 === -0 //true
NaN === NaN // false

// 使用Object.is()进行修正
Object.is(+0, -0) // false
Object.is(NaN, NaN) // true

// 使用ES5 实现Object.is()
Object.defineProperty(Object, 'is', {
  value: function(x, y) {
    if (x === y) {
      // 针对+0 不等于 -0的情况
      return x !== 0 || 1 / x === 1 / y;
    }
    // 针对NaN的情况
    return x !== x && y !== y;
  },
  configurable: true,
  enumerable: false,
  writable: true
});
```

##### 1.4.9 Object.assign()

> `Object.assign()`方法用于对象的合并，将源对象（source）的所有可枚举属性，复制到目标对象（target）。

```javascript
//(1) 存在相同属性，后面的对象的属性对应的值会替换掉前者
const target = { a: 1, b: 1 };

const source1 = { b: 2, c: 2 };
const source2 = { c: 3 };

Object.assign(target, source1, source2);
target // {a:1, b:2, c:3}

// （2）第一个参数不能接收null或者undefined，如果接收的是基本类型会被强制转化为对象类型
Object.assign(undefined) // 报错
Object.assign(null) // 报错
typeof Object.assign(2) // "object"

// (3) 包装对象
Object(true) // {[[PrimitiveValue]]: true}
Object(10)  //  {[[PrimitiveValue]]: 10}
Object('abc') // {0: "a", 1: "b", 2: "c", length: 3, [[PrimitiveValue]]: "abc"}

// (4) 只能拷贝可枚举的属性
Object.assign({b: 'c'},
  Object.defineProperty({}, 'invisible', {
    enumerable: false,
    value: 'hello'
  })
)
// { b: 'c' }
```

##### 1.4.10 object.assign()使用的注意点

```javascript
 //(1) 执行的为浅拷贝，不是深拷贝，如果源对象的属性值为对象，那么目标对象拷贝的只是引用	
const obj1 = {a: {b: 1}};
const obj2 = Object.assign({}, obj1);

obj1.a.b = 2;
obj2.a.b // 2

// (2) 同名属性替换
const target = { a: { b: 'c', d: 'e' } }
const source = { a: { b: 'hello' } }
Object.assign(target, source)// { a: { b: 'hello' } }

// (3) 数组的处理：Object.assign()把数组视为属性名为 0、1、2 的对象，因此源数组的 0 号属性4覆盖了目标数组的 0 号属性1
Object.assign([1, 2, 3], [4, 5])// [4, 5, 3]

// (4) 取值函数 : source对象的foo属性是一个取值函数，Object.assign()不会复制这个取值函数，只会拿到值以后，将这个值复制过去
const source = {
  get foo() { return 1 }
};
const target = {};

Object.assign(target, source)// { foo: 1 }
```

##### 1.4.11  object.assign()的常见用途

```javascript
 //(1) 为对象增加属性
class Point {
  constructor(x, y) {
    Object.assign(this, {x, y});
  }
}

// (2)为对象增加方法
Object.assign(SomeClass.prototype, {
  someMethod(arg1, arg2) {
    ···
  },
  anotherMethod() {
    ···
  }
});

// 等同于下面的写法
SomeClass.prototype.someMethod = function (arg1, arg2) {
  ···
};
SomeClass.prototype.anotherMethod = function () {
  ···
};

// (3) - 1 克隆对象
function clone(origin) { // 仅仅克隆原始对象的值，不能可能继承链上的属性
  return Object.assign({}, origin);
}
//(3) - 2 如何实现继承链上的属性一起拷贝？？
function clone(origin) {
  // 1 ： 先拿到origin的原型对象
  let originProto = Object.getPrototypeOf(origin);
  // 2 : 创建一个obj对象它的原型对象为originProto
  let obj = Object.create(originProto)；
  // 3 ： 将origin对象上可枚举的属性浅拷贝到obj上
  return Object.assign(obj, origin);
}

// (4) 合并多个对象
const merge =(...sources) => Object.assign({}, ...sources);

// (5) 为属性指定默认值 [属性最好都是简单类型，不要使用对象类型]
const DEFAULTS = {
  logLevel: 0,
  outputFormat: 'html'
};

function processContent(options) {
  options = Object.assign({}, DEFAULTS, options);
  console.log(options);
  // ...
}
```

##### 1.4.12 Object.getOwnPropertyDescriptors()

> ES5 的`Object.getOwnPropertyDescriptor()`方法会返回某个对象属性的描述对象（descriptor）
>
> ES2017 引入了Object.getOwnPropertyDescriptors()`方法，返回指定对象所有自身属性（非继承属性）的描述对象。

```javascript
// (1) 基本使用 
const obj = {
  foo: 123,
  get bar() { return 'abc' }
};

Object.getOwnPropertyDescriptors(obj)
// { foo:
//    { value: 123,
//      writable: true,
//      enumerable: true,
//      configurable: true },
//   bar:
//    { get: [Function: get bar],
//      set: undefined,
//      enumerable: true,
//      configurable: true } }

// （2）自定义实现：getOwnPropertyDescriptors
function getOwnPropertyDescriptors(obj) {
  const result = {};
  for (let key of Reflect.ownKeys(obj)) {
    result[key] = Object.getOwnPropertyDescriptor(obj, key);
  }
  return result;
}
```

##### 1.4.13 Object.getOwnPropertyDescriptors()也可以用来实现 Mixin（混入）模式

```javascript
let mix = (object) => ({
  with: (...mixins) => mixins.reduce(
    (c, mixin) => Object.create(
      c, Object.getOwnPropertyDescriptors(mixin)
    ), object)
});

// multiple mixins example
let a = {a: 'a'};
let b = {b: 'b'};
let c = {c: 'c'};
let d = mix(c).with(a, b);

d.c // "c"
d.b // "b"
d.a // "a"
```

##### 1.4.14 [--proto--]属性，Object.setPrototypeOf()，Object.getPrototypeOf()

```javascript
/*
  Object.setPrototypeOf()（写操作）、
  Object.getPrototypeOf()（读操作）、
  Object.create()（生成操作）代替。
*/

// （1）设置对象的原型对象
// 格式
Object.setPrototypeOf(object, prototype)

// 用法
const o = Object.setPrototypeOf({}, null);

// (2) 获取对象的原型对象
Object.getPrototypeOf(obj);

```

##### 1.4.15 Object.keys()，Object.values()，Object.entries()

```javascript
// （1）Object.keys()
var obj = { foo: 'bar', baz: 42 };
Object.keys(obj)
// ["foo", "baz"]

// 用法
const o = Object.setPrototypeOf({}, null);

// (2) Object.values()
const obj = { foo: 'bar', baz: 42 };
Object.values(obj)
// ["bar", 42]

// (3) Object.entries() 
const obj = { foo: 'bar', baz: 42 };
Object.entries(obj)
// [ ["foo", "bar"], ["baz", 42] ]

```

##### 1.4.16  Object.entries()和Object.fromEntries() 

```javascript
// (1) Object.entries()
const obj = { foo: 'bar', baz: 42 };
Object.entries(obj)
// [ ["foo", "bar"], ["baz", 42] ]

//(2) Object.fromEntries() 
Object.fromEntries([
  ['foo', 'bar'],
  ['baz', 42]
])
// { foo: "bar", baz: 42 }

// 具体用途
Object.fromEntries(new URLSearchParams('foo=bar&baz=qux'))
// { foo: "bar", baz: "qux" }

```

#### 