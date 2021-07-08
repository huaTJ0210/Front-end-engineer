// (1)使用递归定义一个倒计时函数
function countDown(i) {
  if (i < 0) {
    return; // base case :基线条件，也就是递归终止的条件
  } else {
    // 递归条件
    console.log(i);
    countDown(i - 1);
  }
}

countDown(10);
