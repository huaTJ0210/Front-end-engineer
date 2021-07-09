### 1、实例变量与new命令

```javascript
/*
(1) Object Oriented Programming[OOP]：一种主流的编程范式【范式：公认的模型或者模式】
(2) JavaScript语言的对象体系，不是基于“类”的，而是基于构造函数（constructor）和原型链（prototype）
(3) 构造函数（constructor）：专门用来生成实例对象的函数，他就是对象的模板；
*/
// 构造函数：函数内部使用this代表将要新生成的实例对象，并且使用new关键字创建实例对象
var Student = function (name) {
  this.name = name;
};
/*
 new 命令的原理
 （1） 创建一个空对象，作为要返回的对象实例；
 （2） 将空对象的原型，指向构造函数的【prototype】属性
 （3） 将空对象赋值给函数内部的this关键字
 （4） 开始执行构造函数内部的代码
*/

var stu = new Student('li');


// *** new命令简化的内部流程图 ***
function _new(/* 构造函数 */ constructor, /* 构造函数参数 */ params) {
  // 将 arguments 对象转为数组
  var args = [].slice.call(arguments);
  // 取出构造函数
  var constructor = args.shift();
  // 创建一个空对象，继承构造函数的 prototype 属性
  var context = Object.create(constructor.prototype);
  // 执行构造函数
  var result = constructor.apply(context, args);
  // 如果返回结果是对象，就直接返回，否则返回 context 对象
  return (typeof result === 'object' && result != null )? result : context;
}

// 实例
// var actor = _new(Person, '张三', 28);

var person1 = {
  name: '张三',
  age: 38,
  greeting: function () {
    console.log("Hi! I'm " + this.name + '.');
  },
};

var person2 = Object.create(person1);
console.dir(person2);
```

### 2、this

```javascript
// (1) this 就是属性或者方法当前所在的对象
var person = {
  name: '张三',
  describe: function () {
    return '姓名' + this.name;
  },
};
person.describe(); // "姓名：张三"


/*
  (2) 由于函数可以在不同的运行环境中执行，因此要提供一种机制在函数体内部获取当前的执行环境；
  所以this就出现了，它设计的目的就是在函数体内部，指代函数当前的运行环境
*/

// (3) Function.prototype.call():指定函数内部this的指向（函数执行所在的作用域）
//  func.call(thisValue, arg1, arg2, ...) : 其他参数为函数调用时需要的参数
var obj = {};
var f = function () {
  return this;
};
f() === window; // true
f.call(obj) === obj; //true

// (3-1) call方法可以调用对象的原生方法（继承得到的方法）
Object.prototype.hasOwnProperty.call(obj,'toString');

// (4) Function.prototype.apply(thisValue,[args1,args2,args3])
// (4-1)找出数组中最大数
var a = [10,2,4,15,9];
Math.max.apply(null,a);
Array.apply(null,['a',,'b']);

// (5) Function.prototype.bind() ： 将函数体内的this绑定到某个对象上，返回一个新函数 

var counter = {
  count: 0,
  inc:function() {
    this.count++;
  }
}
var func = counter.inc.bind(counter);
func();
counter.count;// 1 

      
```
### 3、super

super:间接代表 Object.getPrototypeOf();

