import 'package:cgsapp/pages/cheguansuo/utils/config/cgs_config.dart';

class Global {
  // 车管所开发环境配置
  static final cgsDevelopmentConfig = {
    "appId": '101000001192',
    "secretKey": 'C7717A19F0615B0BBE07286253B9E823',
    "baseUrl": "https://mock.zhongchebaolian.com/",
    "loginUrl":
        "https://t200renzheng.zhengtoon.com/open/m/login/goUserLogin?client_id=100100000251&redirect_uri=https://suishoupai.zhongchebaolian.com/uc/ucfront/userauth&response_type=code&scope=user_info&state=101000001191"
  };

  static Future init() async {
    /*
      开发环境为: dev
      产线环境为: prod
    */

    var env = 'dev';
    if (env == 'dev') {
      // (1) 车管所开发环境配置
      configPlatform(cgsDevelopmentConfig, CGSHttpConfig.instance);
    } else if (env == 'prod') {}
  }

  // 根据配置信息，初始化相应的子系统
  static void configPlatform(Map<String, String> config, dynamic platform) {
    platform.appId = config['appId'];
    platform.secretKey = config['secretKey'];
    platform.baseUrl = config['baseUrl'];
    platform.loginUrl = config['loginUrl'];
  }
}
