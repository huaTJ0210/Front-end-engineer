import 'package:flutter/material.dart';
import 'package:flutter_basic_tips/Route/formTestRoute.dart';
import 'package:flutter_basic_tips/Route/login.dart';
import 'package:flutter_basic_tips/Route/mine.dart';
import 'package:flutter_basic_tips/Route/newRoute.dart';
import 'package:flutter_basic_tips/package/package.dart';
import 'package:flutter_basic_tips/scrollview/ListView/ListViewPage.dart';
import 'package:flutter_basic_tips/scrollview/ScrollViewPage.dart';
import 'package:flutter_basic_tips/scrollview/SingleChildScrollView/SingleChildSrollViewRoute.dart';
import 'package:flutter_basic_tips/widgetBasic/login.dart';
import 'InheritedWidget/InheritedWidget.dart';
import 'Route/RoutePageC.dart';
import 'Route/RoutePageA.dart';
import 'Route/RoutePageB.dart';
import 'widgetBasic/stateLifeCycle.dart';
import 'widgetBasic/widgetBasic.dart';

import 'container/ScaffoldRoute.dart';
import 'container/containerBasic.dart';
import 'container/tabBarRoute.dart';
import 'event/gesturePage.dart';
import 'event/pointerEvent.dart';
import 'layout/ChildrenLayout.dart';
import 'layout/FlexLayout.dart';
import 'layout/SingleChildLayout.dart';
import 'layout/layoutBasic.dart';
import 'layout/linearLayout.dart';
import 'scrollview/ListView/CustomListViewPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      // 基本路由表注册
      routes: {
        'newRoute': (context) => NewRoute(),
        'package': (context) => Package(),
        'stateLifeCycle': (context) => StateLifeCycle(),
        'basicLogin': (constext) => BasicLogin(),
        'formTestRoute': (context) => FormTestRoute(),
        'basicWiget': (context) => BasicWidget(),
        'LayoutBasic': (context) => LayoutBasic(),
        'LinearLayout': (context) => LinearLayout(),
        'FlexLayout': (context) => FlexLayout(),
        'SingleChildWidgetLayout': (context) => SingleChildWidgetLayout(),
        'ContainerBasic': (context) => ContainerBasic(),
        'ScaffoldRoute': (context) => ScaffoldRoute(),
        'TabBarRoute': (context) => TabBarRoute(),
        'PointerEventRoute': (context) => PointerEventRoute(),
        'SingleChildScrollView': (context) => SingleChildScrollViewRoute(),
        'ChildrenLayout': (context) => ChildrenLayout(),
        'ListViewPage': (context) => ListViewPage(),
        'CustomListViewPage': (context) => CustomListViewPage(),
        'GesturePage': (context) => GesturePage(),
        'ScrollViewPageRoute': (context) => ScrollViewPageRoute(),
        'InheritedWidgetPage':(context) => InheritedWidgetPage(),
        'RoutePageA':(context) => RoutePageA(),
        'RoutePageB':(context) => RoutePageB(),
         'RoutePageC':(context) => RoutePageC()
      },
      //需要登录和不需要登录的页面区分
      // 进行统一的权限控制
      onGenerateRoute: (RouteSettings setting) {
        return MaterialPageRoute(builder: (context) {
          String routeName = setting.name;
          if (routeName == 'login') {
            return Login();
          } else if (routeName == 'mine') {
            return Mine();
          }
          return null;
        });
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final items = <String>[
    'basicWiget',
    'LayoutBasic',
    'ContainerBasic',
    'PointerEventRoute',
    'ScrollViewPageRoute',
    'GesturePage',
    'InheritedWidgetPage'
  ];

  _itemsTap(int index, BuildContext context) async {
    Navigator.pushNamed(context, "${items[index]}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('$index :: ${items[index]}'),
                onTap: () {
                  print(index);
                  _itemsTap(index, context);
                },
              );
            },
            itemCount: items.length));
  }
}
