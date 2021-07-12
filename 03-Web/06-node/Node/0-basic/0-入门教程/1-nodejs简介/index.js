//(1)读取环境变量
process.env.NODE_ENV = 'development';
console.log(process.env.NODE_ENV);
// (2) 控制台输出,格式化输出
console.log('name:%s,age:%d', 'li', 18);
console.log('*********************');
// (3)node CLI的交互
/*
const readline = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout,
});

readline.question(`你叫什么名字?`, (name) => {
  console.log(`你好 ${name}!`);
  readline.close();
});
*/

// (4) 控制台打印对象
const obj = {
  name: 'li',
  age: 18,
  hobby: ['swimming', 'running', 'travel'],
  other: {
    a: 1,
    b: 2,
  },
};

console.log(JSON.stringify(obj, null, 2));
