import 'package:flutter/material.dart';

class PointerEventRoute extends StatefulWidget {
  PointerEventRoute({Key key}) : super(key: key);

  @override
  _PointerEventRouteState createState() => _PointerEventRouteState(); 
}

class _PointerEventRouteState extends State<PointerEventRoute> {
  PointerEvent _event;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('点击事件'),
      ),
      body: Listener(
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 150,
          child: Text(
            _event?.toString() ?? '',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.green,
        ),
        onPointerDown: (PointerEvent event) => setState(() => _event = event),
        onPointerMove: (PointerEvent event) => setState(() => _event = event),
        onPointerUp: (PointerEvent event) => setState(() => _event = event),
        /*
          behavior: 决定子组件如何响应命中测试
        */
      ),
    );
  }
}
