'use strict';
function add(a, b) {
  return a + b;
}
function subtraction(a, b) {
  return a - b;
}

function hello() {
  console.log('hello cal');
}

/*
  下面问题出现的hello导出为undefined的原因：
  exports是引用 module.exports的值。module.exports 被改变的时候，
  exports不会被改变，而模块导出的时候，真正导出的执行是module.exports，而不是exports
*/
/*
module.exports = { add, subtraction };
exports.hello = hello;
console.log(exports);
*/

// module.exports = { add, subtraction };
exports.hello = hello;
exports.add = add;
exports.subtraction = subtraction;
console.log(module.exports);
