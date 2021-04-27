import 'package:flutter/material.dart';

class BasicWidget extends StatelessWidget {

  final widgets = <String>['普通路由及传参', '路由钩子', '包管理','state的生命周期','登录','form表单'];

  void _tap(int index,BuildContext context) async{
     switch (index) {
      case 0:
        {
          var params = await  Navigator.of(context)
              .pushNamed('newRoute', arguments: {'index': index});
          print(params);
        }
        break;
      case 1:
        {
          Navigator.of(context).pushNamed('login');
        }
        break;
      case 2:
        {
          Navigator.of(context).pushNamed('package');
        }
        break;
        case 3:
        {
          Navigator.of(context).pushNamed('stateLifeCycle');
        }
        break;
        case 4:
        {
          Navigator.of(context).pushNamed('basicLogin');
        }
        break;
        case 5:
        {
          Navigator.of(context).pushNamed('formTestRoute');
        }
        break;
      default:
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基本组件'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('$index::${widgets[index]}'),
            onTap: () {
              _tap(index,context);
            },
          );
        },
        itemCount: widgets.length,
      ),
    );
  }
}
