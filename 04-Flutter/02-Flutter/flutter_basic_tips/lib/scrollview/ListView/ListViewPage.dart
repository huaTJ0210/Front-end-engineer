import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('sliver')),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          //SliverAppBar作为头图控件
          leading: Text(''),
          floating: true, //设置悬浮样式
          flexibleSpace: Image.network(
              "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.ewebweb.com%2Fuploads%2F20190506%2F12%2F1557118007-IyrZQJcGwq.jpg&refer=http%3A%2F%2Fimg.ewebweb.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1613028473&t=260f420816dd8571a6a4cc7470f12582",
              fit: BoxFit.cover), //设置悬浮头图背景
          expandedHeight: 300, //头图控件高度
        ),
        SliverList(
          //SliverList作为列表控件
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(title: Text('Item #$index')), //列表项创建方法
            childCount: 100, //列表元素个数
          ),
        ),
      ]),
    );
  }
}
