import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

EventBus eventBus = new EventBus();

class InheritedWidgetPage extends StatefulWidget {
  InheritedWidgetPage({Key key}) : super(key: key);

  @override
  _InheritedWidgetPageState createState() => _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  int count = 0;
  String msg = "通知";
  void incrementCount() => this.setState(() {
        count++;
      });

// eventBus的使用
  StreamSubscription subscription;
  @override
  void initState() {
    // 事件的触发可以直接使用
    // eventBus.fire(CustomEvent('eventBus message'));
    subscription = eventBus.on<CustomEvent>().listen((event) {
      setState(() {
        msg = event.msg;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();// 清理
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 页面的数据流从父向子进行流动，为了避免不必要的组件进行参数传递，可以将根widget继承InheritedWidget
    // 在子组件中直接通过父组件的静态of方法拿到父组件
    return NotificationListener<CustomerNotification>(
      child: CountContainer(
        child: Counter(),
        model: this,
        increment: incrementCount,
      ),
      // ignore: missing_return
      onNotification: (notification) {
        setState(() {
          msg = notification.msg;
          print(msg);
        });
      },
    );
  }
}

// (0)使用inheritedWidget进行父子之间的数据传递
class CountContainer extends InheritedWidget {
  final _InheritedWidgetPageState model;
  final Function increment;
  //方便其子Widget在Widget树中找到它
  static CountContainer of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CountContainer>();

  CountContainer({
    Key key,
    @required this.model,
    @required this.increment,
    @required Widget child,
  }) : super(key: key, child: child);

  // 判断是否需要更新
  @override
  bool updateShouldNotify(CountContainer oldWidget) =>
      model.count != oldWidget.model.count;
}

class Counter extends StatelessWidget {
  const Counter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 在组件树中获取到父组件实例
    CountContainer countContainer = CountContainer.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('count'),
      ),
      body: Column(
        children: [
          Text('You have pushed the button ${countContainer.model.count}'),
          CustomChild()
        ],
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: countContainer.increment),
    );
  }
}

// (1) 自定义通知类
class CustomerNotification extends Notification {
  final String msg;
  CustomerNotification(this.msg);
}

// 抽离widget用来发送组件
class CustomChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () =>
            CustomerNotification('message from custom').dispatch(context),
        child: Text('fire notification '));
  }
}

// (2)使用EventBus进行跨组件的事件传递
class CustomEvent {
  String msg;
  CustomEvent(this.msg);
}
