//(1) 导出API的成员

export function foo() {}

export var awesome = 42;

var bar = [1, 2, 3];
export { bar };

// (2) 其他导出方式

function bar() {}

var name = 'li';

export { bar, name }; // 命名导出，导出变量/函数等的名称绑定；

// (3)命名导出可以重命名

function baz() { }

export { baz as bax }

// (4) 模块导出实际上时这些值的引用

// (5) 默认导出

//(6)模块依赖环 : A导入B，B导入A



