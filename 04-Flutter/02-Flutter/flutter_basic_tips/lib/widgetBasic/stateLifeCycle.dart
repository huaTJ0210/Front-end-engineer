import 'package:flutter/material.dart';

// state 的生命周期
class StateLifeCycle extends StatefulWidget {
  // (1) 初始化构造函数
  StateLifeCycle({Key key, this.initValue: 0}) : super(key: key);
  final int initValue;

  @override
  _StateLifeCycleState createState() => _StateLifeCycleState();
}

class _StateLifeCycleState extends State<StateLifeCycle>
    with WidgetsBindingObserver {
  int _counter;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // 注册监听函数

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print("单次Frame绘制回调"); // 只回调一次
    });

    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      print("实时Frame绘制回调");
    });

    /*
      初始化状态
      （1）当widget第一次插入到widget树中被调用，flutter SDK对于每一个state对象只会调用一次；
      （2）初始化状态、订阅子树的事件通知
    */
    _counter = widget.initValue; // 构造函数可以接收从父视图传递过来的初始化数据
    print('initState');
  }

  @override
  Future<bool> didPopRoute() {
    // TODO: implement didPopRoute
    // 页面pop
    return super.didPopRoute();
  }

  @override
  Future<bool> didPushRoute(String route) {
    // TODO: implement didPushRoute
    // 页面push
    return super.didPushRoute(route);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      print("可见的，能响应用户的输入");
    } else if (state == AppLifecycleState.inactive) {
      print("处于不活动状态，无法处理用户输入");
    } else if (state == AppLifecycleState.paused) {
      print("不可见，并不能响应用户的输入，但是在后台继续活动中");
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    /*
     当state依赖的对象发生改变时调用
    */
    print('---didChangeDependencies');
  }

/*
   Flutter framework会调用widget.canUpdate来检测是否调用didUpdateWidget
*/
  @override
  void didUpdateWidget(StateLifeCycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('----didUpdateWidget');
  }

/*
  当state对象从树中被移除
*/
  @override
  void deactivate() {
    super.deactivate();
    print('----deactivate');
  }

/*
  当state对象从树中被永久移除
*/
  @override
  void dispose() {
    super.dispose();
    print('----dispose');
    // 移除监听函数
    WidgetsBinding.instance.removeObserver(this);
  }

/*
  专门为开发调试创建的回调函数
*/
  @override
  void reassemble() {
    super.reassemble();
    print('---reassemble');
  }

/*
   build主要用于构建widget子树
    (1)在调用initState() 之后
   （2）didUpdateWidget()之后
   （3）setState()之后
   （4）didChangeDependence()之后
   （5）
*/
  @override
  Widget build(BuildContext context) {
    print('---build');
    return Scaffold(
      appBar: AppBar(title: Text('state的生命周期')),
      body: Container(
          child: FlatButton(
        child: Text('$_counter'),
        onPressed: () {
          this.setState(() {
            ++_counter;
          });
        },
      )),
    );
  }
}
