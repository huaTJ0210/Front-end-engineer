import 'package:flutter/material.dart';

class Mine extends StatelessWidget {
  const Mine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Mine')
      ),
      body: Center(
        child:Text('Mine')
      ),
    );
  }
}