/*
  Future与JavaScript的Promise非常相似，表示一个异步任务的最终完成结果
  Future的所有API操作返回值仍旧为Future
*/

main() {
  // 使用Future.delayed创建一个延期任务，使用then接收返回数据
  Future.delayed(new Duration(seconds: 2), () {
    return 'hi duration';
  }).then((data) {
    print(data);
  });

  // 使用catchError捕获错误
  Future.delayed(new Duration(seconds: 2), () {
    throw AssertionError('Error');
  }).then((data) {
    print('success');
  }).catchError((e) {
    print(e);
  });

  // Future.whenComplete : 无论异步任务成功或者失败都要执行的动作；例如：网络请求去除loading
  Future.delayed(new Duration(seconds: 2), () {
    return 'success';
  }).then((data) {
    print(data);
  }).catchError((e) {
    print(e);
  }).whenComplete(() {
    //异步任务无论成功或者失败均要执行的操作
    print('去除loading！！');
  });

  // Future.wait : 多个异步任务都执行（成功）完毕后将结果组合返回
  Future.wait([
    Future.delayed(new Duration(seconds: 2), () {
      print('2s task finish');
    }),
    Future.delayed(new Duration(seconds: 4), () {
      print('4s task finish');
    })
  ]).then((results) {
    print(results[0]);
    print(results[1]);
  });
}
