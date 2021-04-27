import 'package:flutter/material.dart';
import 'package:flutter_basic_tips/container/tabPageOne.dart';
import 'package:flutter_basic_tips/container/tabPageThree.dart';
import 'package:flutter_basic_tips/container/tabPageTwo.dart';

/*
 利用脚手架（Scaffold创建底部导航）
 1、appBar的设置： 左侧按钮，右侧多项菜单
 2、bottomNavigationBar：设置底部的导航
*/
class ScaffoldRoute extends StatefulWidget {
  ScaffoldRoute({Key key}) : super(key: key);

  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 0;
  var pages = [new TabPageOne(), new TabPageTwo(), new TabPageThree()];
  _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
        actions: <Widget>[
          //导航右侧菜单栏设置
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              print('share !!!');
            },
          )
        ],
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        //底部导航
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTap,
      ),
    );
  }
}
