/*
   javascript中的定时器
   + setTimeout：

   +setInterval
   间隔执行，但是函数的运行时间长短会导致设置的间隔时间不准确
*/

// 使用setTimeout模拟setInterval
function simulateInterval(fn, mills) {
  let timer = null;
  (function loop() {
    timer = setTimeout(() => {
      loop();
      fn(); // fn()放在后面是为了避免timer无法清理；
    }, mills);
  })();

  return () => {
    clearTimeout(timer);
  };
}

// 使用时：
let clear = simulateInterval(() => {
  console.log('should only run one time');
  clear();

  // // 10次后自动结束
  // setTimeout(() => {

  // }, 1000);
}, 100);




