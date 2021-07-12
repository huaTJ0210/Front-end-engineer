/*
 (1)Node.js异步而且非堵塞IO，主要因为事件循环：
 Node.js运行在单线程上，每次只能处理一件事情；
 (2)阻塞事件循环
 + JavaScript运算量较大：拆分数据为小块
 + 死循环
 + 同步执行IO操作
 （3）调用堆栈
 + 
*/

const a = () => {
  console.log('(6):a');
};

const b = () => {
  console.log('(3):b');
};

const foo = () => {
  console.log('(1)：foo start');

  // 加入到任务队列的 宏任务队列中，优先级较低
  setTimeout(a, 0);
  //事件循环的下一次迭代后执行，要比nextTick晚，
  //也没有微任务优先级高,和setTimeout差不多：
  setImmediate(() => {
    console.log('setImmediate');
  });
  //微任务队列：调用堆栈执行完毕后，立即执行的任务
  new Promise((resolve, reject) => {
    console.log('(2):初始化promise');
    resolve('(5):promise');
  }).then(
    (value) => {
      console.log(value);
    },
    (error) => {}
  );
  // 告诉引擎在处理同步函数堆栈的任务后尽快执行回调函数，在所有的任务队列之前
  process.nextTick(() => {
    console.log('调用堆栈的代码执行完毕了');
  });
  b();
  console.log('(4)foo:end');
};

foo();
