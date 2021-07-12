// (1)准备module对象:
var module = {
    id: 'hello',
    exports: {}
};
// (2)将js文件中的内容用函数进行包裹，保证定义的变量和函数在局部作用域中
var load = function (module) {
    // 读取的hello.js代码:
    function greet(name) {
        console.log('Hello, ' + name + '!');
    }
    
    module.exports = greet;
    // hello.js代码结束
    return module.exports;
};
//(3) 执行运行时定义的函数 获取js文件的对外输出
var exported = load(module);
//（4）保存module:到全局中
save(module, exported);