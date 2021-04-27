import 'package:flutter/material.dart';

class LayoutBasic extends StatelessWidget {
  final widgets = <String>[
    '线性布局',
    '弹性布局',
    'SingleChildWidgetLayout',
    'ChildrenLayout'
  ];
  void _tap(int index, BuildContext context) async {
    switch (index) {
      case 0:
        {
          Navigator.pushNamed(context, 'LinearLayout');
        }
        break;
      case 1:
        {
          Navigator.pushNamed(context, 'FlexLayout');
        }
        break;
      case 2:
        {
          Navigator.pushNamed(context, 'SingleChildWidgetLayout');
        }
        break;
      case 3:
        {
          Navigator.pushNamed(context, 'ChildrenLayout');
        }
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('布局组件')),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('$index :: ${widgets[index]}'),
            onTap: () {
              _tap(index, context);
            },
          );
        },
        itemCount: widgets.length,
      ),
    );
  }
}
