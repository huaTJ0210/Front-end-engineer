import 'dart:math';

import 'package:cgsapp/framework/utils/zl_crypto.dart';

class HttpTools {
  /*
   基本网络请求参数构建
 */
  static Map<String, String> createRequestParam(
      Map<String, String> param, dynamic platformConfig) {
    var paramsMap = new Map<String, String>();
    // 增加基本参数
    paramsMap['appId'] = platformConfig.appId;
    paramsMap['nonce'] = randomInteger(32);
    paramsMap['timestamp'] =
        new DateTime.now().millisecondsSinceEpoch.toString();
    // 添加业务基础参数
    if (param != null && param.keys.length > 0) {
      paramsMap.addAll(param);
    }
    // 对所有业务参数的key进行排序
    var keys = paramsMap.keys;
    keys.toList().sort();
    // 根据排序后的key进行字符串拼接
    var signString = '';
    keys.forEach(
        (key) => {signString = signString + key + '=' + paramsMap[key] + '&'});
    // 拼接secretKey
    var signOrign = signString + 'secretKey' + '=' + platformConfig.secretKey;
    // 将拼接字符串MD5
    var sign = Md5.md5Util(signOrign).toUpperCase();
    // 将sign添加到请求参数中
    paramsMap['sign'] = sign;
    return paramsMap;
  }

  static String randomInteger(int length) {
    String text = '';
    for (var i = 0; i < length; i++) {
      text = text + Random().nextInt(10).toString();
    }
    return text;
  }
}
