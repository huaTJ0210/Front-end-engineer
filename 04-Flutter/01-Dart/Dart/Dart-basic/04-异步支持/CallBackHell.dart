class CallBackHell{

  // 回调地狱的产生

  Future<String> login(String userName,String pwd){
     // 用户登录
    return Future.delayed(new Duration(seconds: 1),(){
        return 'userid';
    });
  }

  Future<String> getUserInfo(String id){
    // 获取用户信息
    return Future.delayed(new Duration(seconds: 1),(){
      return 'userInfo';
    });
  }

  Future<String> saveUserInfo(String userInfo){
    // 保存用户信息
    return Future.delayed(new Duration(seconds: 1),(){
       return "save success!";
    });
  }

  // 地狱回调
  test(){
    login('userName', '').then((id){
      getUserInfo(id).then((userInfo){
         saveUserInfo(userInfo).then((data){
            print('do something!');
         });
      });
    }).catchError((e){
        print(e);
    });
  }

  // 使用Future解决
  test1(){
    login('userName', '***').then((id){
       return getUserInfo(id);
    }).then((userInfo){
      return saveUserInfo(userInfo);
    }).then((data){
      // 执行保存后的数据
    }).catchError((e){
       print(e);
    });
  }

  /*
  async/await消除callback hell
  async: 表示函数是异步的
  await: 后面是一个future，表示等待该异步任务完成后才往下走
  */ 
  test2() async{
    try{
      String id = await login('userName', '***');
      String userInfo = await getUserInfo(id);
      await saveUserInfo(userInfo);
    }catch(e){
      print(e);
    }
  }

  /*
    Stream :接收异步事件数据，与Future不同它可以接收多个异步操作的结果（成功或者失败）
  */
  void test3(){
    Stream.fromFutures([
      // 1秒返回结果
      Future.delayed(new Duration(seconds: 1),(){
         return 'hello 1';
      }),
      // 2秒抛出异常
      Future.delayed(new Duration(seconds: 2),(){
         throw AssertionError('Error');
      }),
      // 3秒返回一个结果
      Future.delayed(new Duration(seconds: 3),(){
        return 'hello 3';
      })
    ]).listen((data){
      print(data);
    },onError: (e){
       print(e);
    },onDone: (){

    });
  }

}