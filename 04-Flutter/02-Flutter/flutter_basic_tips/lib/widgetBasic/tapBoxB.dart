import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  ParentWidget({Key key}) : super(key: key);

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;
  void _changeValue(value) {
    setState(() {
      _active = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TapBoxB(
      active: _active,
      changeValue: _changeValue,
    ));
  }
}

/*
  组件state由父组件管理，子组件传递方法的回调
*/
class TapBoxB extends StatelessWidget {
  const TapBoxB({Key key, this.active: false, this.changeValue})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> changeValue;

  void handleTap() {
    changeValue(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: handleTap,
        child: Container(
            child: Text(active ? 'active' : 'inactive'),
            width: 200,
            height: 200,
            decoration:
                BoxDecoration(color: active ? Colors.red : Colors.blue)));
  }
}
