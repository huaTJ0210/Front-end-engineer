import 'package:flutter/material.dart';

import 'RoutePageC.dart';

class RoutePageB extends StatelessWidget {
  const RoutePageB({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('RoutePageB')),
        body: Column(
          children: [
            Text('RoutePageB'),
            RaisedButton(
                child: Text('pageB push next Page'),
                onPressed: () {
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RoutePageC()))
                      .then((value) => print(value));
                }),
          ],
        ));
  }
}
