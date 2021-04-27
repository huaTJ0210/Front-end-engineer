import 'package:flutter/material.dart';

class ContainerBasic extends StatelessWidget {
  final widgets = ['Scaffold'];
  _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        {
          Navigator.pushNamed(context, 'ScaffoldRoute');
        }
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('容器组件')),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('${widgets[index]}'),
            onTap: () {
              _onTap(context, index);
            },
          );
        },
        itemCount: widgets.length,
      ),
    );
  }
}
