import 'package:flutter/material.dart';

class RoutePageC extends StatelessWidget {
  const RoutePageC({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('RoutePageC')),
        body: Column(
          children: [
            Text('RoutePageC'),
            RaisedButton(
              child: Text('pop to PageB'),
              onPressed: () {
                //返回PageB
                Navigator.pop(context, 'data from PageC');
              },
            )
          ],
        ));
  }
}
