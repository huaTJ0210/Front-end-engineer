//(1) 导出API的成员

export function foo() {}

export var awesome = 42;

var bar = [1, 2, 3];
export { bar };

// (2) 其他导出方式

function bar() {}

var name = 'li';

export { bar, name }; // 命名导出，导出变量/函数等的名称绑定；
