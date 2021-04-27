import 'package:flutter/material.dart';

class ChildrenLayout extends StatelessWidget {
  const ChildrenLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("多子widget布局"),
        ),
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                          color: Colors.yellow,
                          height: 60)), //设置了flex=1，因此宽度由Expanded来分配
                  Container(
                    color: Colors.red,
                    width: 100,
                    height: 180,
                  ),
                  Container(
                    color: Colors.black,
                    width: 60,
                    height: 80,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(color: Colors.green, height: 60),
                  ) //设置了flex=1，因此宽度由Expanded来分配
                ],
              )
            ],
          ),
        ));
  }
}
