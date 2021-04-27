import 'package:flutter/material.dart';

class ScrollViewPageRoute extends StatelessWidget {
  final items = ['SingleChildScrollView','ListViewPage','CustomListViewPage'];
  void _onTap(int index,BuildContext context) {
    Navigator.pushNamed(context, "${items[index]}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('可滚动视图'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${items[index]}"),
            onTap: () {
              _onTap(index,context);
            },
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
