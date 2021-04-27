import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  const NewRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 路由获取：传参
    // 将Object类型变量转化为指定类型使用 as关键字
    var args = ModalRoute.of(context).settings.arguments as Map<String, int>;
    if (args == null) {
      args = {"index": 1};
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('路由'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Text('${args["index"]}'),
          RaisedButton(
            child: Text('返回'),
            onPressed: () {
              // 返回上一级页面并返回 参数
              Navigator.of(context).pop('text');
            },
          )
        ],
      )),
    );
  }
}
