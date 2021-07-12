const { hello, subtraction, add } = require('./cal');

/*
  Common.js规范：
  （1）每个.js文件都是一个模块，内部使用相同名称的变量和函数不会发生冲突
  （2）模块中的变量（函数也是变量）对外暴露时使用module.exports = variableName;
  （3）外部模块使用： var variableName = require('./moduleName')
  (4)每一个node.js执行文件，都自动创建一个module对象，
    同时，module对象会创建一个叫exports的属性，初始化的值是 {}
*/

/*
  模块化原理：
  （1）全局变量变成局部变量，在JavaScript中就是将变量声明在函数作用域中
  （2）Node利用JavaScript的函数式编程的特性，实现了模块化隔离
  (function () {
    var s = 'Hello'
    function greet(name) {
      console.log(s + ',' + name + '!')
    }
  }
)()
*/

/*
  module.exports 与 exports的理解：【把exports看成是对module.exports的引用】
  （1）以下可行:相当于给引用对象增加属性
   exports.hello = hello;
   exports.greet = greet;   
   （2）以下不可行：exports指向了一个新的对象，导致module.exports还是{}
   exports = {
    hello: hello,
    greet: greet
};
*/

const a = add(3, 2);
console.log(a);

const b = subtraction(4, 5);
console.log(b);

console.log(hello()); //undefined
