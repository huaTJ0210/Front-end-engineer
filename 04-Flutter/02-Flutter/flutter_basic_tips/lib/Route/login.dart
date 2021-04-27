import 'package:flutter/material.dart';

import 'newRoute.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: Column(
          children: [
            RaisedButton(
              child: Text('基本路由'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewRoute()));
              },
            ),
            Text('to page A'),
            RaisedButton(
              child: Text('push to page A'),
              onPressed: () {
                Navigator.pushNamed(context, "RoutePageA");
              },
            )
          ],
        ));
  }
}
