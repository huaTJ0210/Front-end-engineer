

import 'package:cgsapp/framework/base_dart/object_model.dart';

class UserModel implements ObjectModel<UserModel> {
  String phone;
  String token;
  int workPlatformUser;
  String name;
  String idNumber;

  static UserModel _instance;

  factory UserModel() => _getInstance();

  static UserModel get instance => _getInstance();

  UserModel._internal();

  static UserModel _getInstance() {
    if (_instance == null) {
      _instance = UserModel._internal();
      /*
        0:"phone_no" -> "18518487767"
1:"is_work_platform_user" -> 0
2:"cert_no" -> "370403199002105670"
3:"cgs_token" -> "1d73d553253444aa906b00039d774878"
4:"user_name" -> "华天杰"
      */
      _instance.name = '华天杰';
      _instance.token = "1d73d553253444aa906b00039d774878";
      _instance.idNumber = "370403199002105670";
      _instance.workPlatformUser = 0;
      _instance.phone = "18518487767";
    }
    return _instance;
  }

  bool isLogin() {
    return token != null;
  }

  void clean() {
    this.phone = null;
    this.token = null;
  }

  @override
  UserModel modelWithJSON({Map<String, dynamic> map, List list}) {
    phone = map['phone_no'];
    token = map['cgs_token'];
    workPlatformUser = map['is_work_platform_user'];
    name = map['user_name'];
    idNumber = map['cert_no'];
    return this;
  }
}
