
import 'package:cgsapp/utils/http/httpConfig.dart';

class Global {
  static Future init() async {
    /*
      开发环境为: dev
      产线环境为: prod
    */
    var env = 'dev';
    if (env == 'dev') {
      HttpConfig.instance.appId = '101000001192';
      HttpConfig.instance.secretKey = 'C7717A19F0615B0BBE07286253B9E823';
      HttpConfig.instance.baseUrl = 'https://mock.zhongchebaolian.com/';
      HttpConfig.instance.loginUrl = 'https://t200renzheng.zhengtoon.com/open/m/login/goUserLogin?client_id=100100000251&redirect_uri=https://suishoupai.zhongchebaolian.com/uc/ucfront/userauth&response_type=code&scope=user_info&state=101000001191';
    } else if (env == 'prod') {
      HttpConfig.instance.appId = '';
      HttpConfig.instance.secretKey = '';
      HttpConfig.instance.baseUrl = '';
      HttpConfig.instance.loginUrl = '';
    }
  }
}
