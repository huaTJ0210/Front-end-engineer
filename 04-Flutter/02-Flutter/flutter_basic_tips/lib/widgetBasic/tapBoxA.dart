import 'package:flutter/material.dart';

class TapBoxA extends StatefulWidget {
  TapBoxA({Key key}) : super(key: key);

  @override
  _TapBoxAState createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {
  bool _active = false;
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Text(
          '${_active ? 'active' : 'unactive'}',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(color: _active ? Colors.blue : Colors.red),
      ),
    );
  }
}
