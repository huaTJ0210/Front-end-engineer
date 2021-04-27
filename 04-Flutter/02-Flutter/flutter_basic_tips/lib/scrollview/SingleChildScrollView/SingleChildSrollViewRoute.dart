import 'package:flutter/material.dart';

class SingleChildScrollViewRoute extends StatelessWidget {
  const SingleChildScrollViewRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text('scrollView'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: str
                  .split('')
                  .map((c) => Text(c, textScaleFactor: 2.0))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
