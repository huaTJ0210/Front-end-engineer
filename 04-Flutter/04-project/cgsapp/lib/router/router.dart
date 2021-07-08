import 'package:cgsapp/pages/cheguansuo/buiness/business_detail_page.dart';
import 'package:cgsapp/pages/cheguansuo/buiness/business_type_list_page.dart';
import 'package:cgsapp/pages/cheguansuo/certificate/certificate_list_page.dart';
import 'package:cgsapp/pages/cheguansuo/login/login_page.dart';
import 'package:flutter/widgets.dart';

class ZLRouter {
  // 路由页面标识
  static final String loginPage = 'loginPage';
  static final String businessTypeListPage = 'businessTypeListPage';
  static final String businessDetailPage = 'businessDetailPage';
  static final String certificateListPage = 'certificateListPage';

  static final Map<String, Widget Function(BuildContext)> routes = {
    loginPage: (BuildContext context) => LoginPage(),
    businessTypeListPage: (BuildContext context) => BusinessTypeListPage(),
    businessDetailPage: (BuildContext context) => BusinessDetailPage(),
    certificateListPage: (BuildContext context) => CertificateListPage()
  };
}
