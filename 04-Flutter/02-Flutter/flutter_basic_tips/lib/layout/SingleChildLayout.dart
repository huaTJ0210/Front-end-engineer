import 'package:flutter/material.dart';

class SingleChildWidgetLayout extends StatelessWidget {
  const SingleChildWidgetLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SingleChildWidgetLayout'),
      ),
      body: Column(
        children: [
          Container(
            child: Padding(//单独设置子视图相对于父视图的边距（左上右下）
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text('子widget设置边距')),
            margin: EdgeInsets.all(44.0), // 整体容器的外边距
            width: 180,
            height: 240,
            // alignment: Alignment.center, //子widget居中对齐
            decoration: BoxDecoration(
                color: Colors.red, // 北京色
                borderRadius: BorderRadius.circular(10.0)), //圆角边框
          ),
        ],
      ),
    );
  }
}
