import 'package:flutter/material.dart';

class CustomListViewPage extends StatefulWidget {
  CustomListViewPage({Key key}) : super(key: key);

  @override
  _CustomListViewPageState createState() => _CustomListViewPageState();
}

class _CustomListViewPageState extends State<CustomListViewPage> {
  // 创建ListView的控制器
  ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset > 200) {
        // print("offSet > 200");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body: NotificationListener(
            //添加NotificationListener作为父容器
            // ignore: missing_return
            onNotification: (scrollNotification) {
              //注册通知回调
              if (scrollNotification is ScrollStartNotification) {
                //滚动开始
                print('Scroll Start');
              } else if (scrollNotification is ScrollUpdateNotification) {
                //滚动位置更新
                print('Scroll Update');
              } else if (scrollNotification is ScrollEndNotification) {
                //滚动结束
                print('Scroll End');
              }
            },
            child: ListView.separated(
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {
                return Container(height: 50, child: Text('title:$index'));
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(color: Colors.grey);
              },
              itemCount: 100,
            )));
  }

  @override
  void dispose() {
    _controller.dispose(); // 销毁控制器
    super.dispose();
  }
}
