import 'package:flutter/material.dart';

class RoutePageA extends StatelessWidget {
  const RoutePageA({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('RoutePagea')),
        body: Column(
          children: [
            Text('RoutePagea'),
            RaisedButton(
              child: Text('PageA push next Page'),
              onPressed: () {
                // push next page and get data from next page pop
                Navigator.pushNamed(context, 'RoutePageB',
                    arguments: {"A": "a-value"}).then((value) => print(value));
              },
            )
          ],
        ));
  }
}
