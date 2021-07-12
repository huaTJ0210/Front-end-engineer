```javascript
/*
   (1)Promise 对象是 JavaScript的异步操作解决方案；它起到代理作用（proxy），充当异步操作与回调函数之间的中介，使得异步操作具备同步操作的接口。Promise 可以让异步操作写起来，就像在写同步操作的流程，而不必一层层地嵌套回调函数
  */
/*
   (3) Promise构造函数: 接收一个函数作为参数；
   函数有两个参数；负责修改初始状态（pending）
   resolve: 将promise的状态修改为fulfilled
   reject : 将promise的状态修改为rejected
 */
var promise = new Promise(function (resolve, reject) {
  var isSuccess = true;
  if (isSuccess) {
    resolve();
  } else {
    reject();
  }
});

/*
  (4) Promise.prototype.then()用来添加回调函数
  then方法可以接受两个回调函数，第一个是异步操作成功时（变为fulfilled状态）的回调函数，
  第二个是异步操作失败（变为rejected）时的回调函数（该参数可以省略）。
  一旦状态改变，就调用相应的回调函数
*/

//(5) then用法的解析
// 写法一
f1()
  .then(function () {
    return f2();
  })
  .then(f3); // f3回调函数参数是f2的执行结果

// 写法二
f1()
  .then(function () {
    f2();
    return;
  })
  .then(f3); //f3回调函数参数是undefined

// 写法三
f1().then(f2()).then(f3); // f3回调函数参数是f2返回函数的运行结果

// 写法四
f1().then(f2).then(f3); //f2会接收到f1()返回的结果
// (6)  加载图片
var preloadImage = function (path) {
  return new Promise(function (resolve, reject) {
    var image = new Image();
    image.onload = resolve;
    image.onerror = reject;
    image.src = path;
  });
};
preloadImage('https://example.com/my.jpg')
  .then(function (e) {
    /*
             图片加载成功以后，onload属性会返回一个事件对象，
             因此第一个then()方法的回调函数，会接收到这个事件对象。
             该对象的target属性就是图片加载后生成的 DOM 节点
            */
    document.body.append(e.target);
  })
  .then(function () {
    console.log('加载成功');
  });
/*
         (7) 小结：
         Promise让回调函数变成规范的链式写法；程序的流程可以看的很清楚；
       */
/*
          (8) 微任务
          1、普通异步任务：JavaScript引擎遇到异步任务（setTimeout、setInterval）等会将
          异步任务放在【下一次事件循环】中检验执行；
          2、微任务[micotask]：本轮事件循环执行完成，会优先检查微任务队列中是否存在待执行的任务，
          如果没有才进行下一次事件的循环；
        */
setTimeout(function () {
  console.log(1);
}, 0); // 1: 异步任务
new Promise(function (resolve, reject) {
  resolve(2); // 2: 微任务
}).then(console.log);
console.log(3); // 3：同步任务
```

