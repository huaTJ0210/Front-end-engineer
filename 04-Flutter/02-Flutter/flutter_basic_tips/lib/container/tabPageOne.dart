import 'package:flutter/material.dart';

class TabPageOne extends StatelessWidget {
  const TabPageOne({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.red,
      child: FlatButton(
        child: Text(
          'push next page',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'TabBarRoute');
        },
      ),
    );
  }
}
