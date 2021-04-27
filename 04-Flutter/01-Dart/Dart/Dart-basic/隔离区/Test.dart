/*
 （1） how to schedule a task
  1.1 : 使用future创建的任务会被加到event queue
  1.2 : 使用scheduleMicrotask()可以创建任务到 microtask queue 【任务处理的优先级比较高】

  + Dart App的event loop执行的task来源：event queue和microtask queue
  + 
*/

import 'dart:async';

void main() {
  /*
  // (1) 向event loop安排一个task，使用 new Future()
  new Future(() {
    return 21;
  }).then((value) {
    return value * 2;
  }).then((value) {
    print(value);
  });

  // （2）延迟执行: 如果main isolates或者event loop 在执行较为耗时的操作，延迟执行的任务就不能被执行，
  //  只能等待，这样任务延迟执行的时间会超过3秒钟
  new Future.delayed(new Duration(seconds: 3), () {
    print('future delayed!!!');
  });

  // (3)
  scheduleMicrotask(() {
    // 执行task
  });
  */

  print('main #1 of 2');
  scheduleMicrotask(() => print('microtask #1 of 3'));

  new Future.delayed(
      new Duration(seconds: 1), () => print('future #1 (delayed)'));

  new Future(() => print('future #2 of 4'))
      .then((_) => print('future #2a'))
      .then((_) {
    print('future #2b');
    scheduleMicrotask(() => print('microtask #0 (from future #2b)'));
  }).then((_) => print('future #2c'));

  scheduleMicrotask(() => print('microtask #2 of 3'));

  new Future(() => print('future #3 of 4'))
      .then((_) => new Future(() => print('future #3a (a new future)')))
      .then((_) => print('future #3b'));

  new Future(() => print('future #4 of 4'));
  scheduleMicrotask(() => print('microtask #3 of 3'));
  print('main #2 of 2');

  /*
    main #1 of 2
    main #2 of 2

    microtask #1 of 3
    microtask #2 of 3
    microtask #3 of 3

    future #2 of 4
    future #2a
    future #2b
    future #2c

    microtask #0 (from future #2b)
    future #3 of 4
    future #4 of 4

    

    future #3a (a new future)
    future #3b

    future #1 (delayed)
  */
}
