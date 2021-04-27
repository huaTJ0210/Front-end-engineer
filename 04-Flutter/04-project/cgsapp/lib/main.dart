import 'package:cgsapp/views/business/businessDetailPage.dart';
import 'package:cgsapp/views/login/loginPage.dart';
import 'package:cgsapp/models/userModel.dart';
import 'package:flutter/material.dart';

import 'configs/Global.dart';

import 'views/business/businessListPage.dart';
import 'views/business/handleInstructions.dart';
import 'views/home/home.dart';
import 'views/mine/certificateListPage.dart';
import 'views/mine/mine.dart';
import 'views/records/records.dart';

void main() {
  // app启动前初始化全局配置变量
  Global.init().then((value) => {runApp(MyApp())});
}

Map<String, Function> generateRoutes = {};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '掌上车管所',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(title: '首页'),
      routes: {
        'loginPage': (BuildContext context) => LoginPage(),
        'businessListPage': (BuildContext context) => BusinessListPage(),
        'businessDetailPage': (BuildContext context) => BusinessDetailPage(),
        'certificateListPage': (BuildContext context) => CertificateListPage()
      },
      onGenerateRoute: (RouteSettings settings) {
        if (!UserModel.instance.isLogin()) {
          return MaterialPageRoute(
              builder: (BuildContext context) => LoginPage());
        } else {
          String routeName = settings.name;
          Function builder = generateRoutes[routeName];
          return MaterialPageRoute(builder: builder);
        }
      },
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  var pages = [new HomePage(), new RecordsPage(), new MinePage()];
  _onItemTap(int index) {
    if (UserModel.instance.isLogin()) {
      setState(() {
        _selectedIndex = index;
      });
    } else {
      if (index == 1 || index == 2) {
        Navigator.pushNamed(context, 'loginPage');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        //底部导航
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '车管所'),
          BottomNavigationBarItem(icon: Icon(Icons.description), label: '办理记录'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTap,
      ),
    );
  }
}
