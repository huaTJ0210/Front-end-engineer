import 'dart:math';

import 'package:cgsapp/utils/crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'dart:convert' as convert;

import 'httpConfig.dart';


class HttpResult {
  const HttpResult(this.success, this.data);
  final bool success;
  final dynamic data;
}

class HttpFile {
  String fileName;
  String filePath;
  String upLoadKey;
  String otherParamKey;
  HttpFile(String fileName, String filePath,
      [String upLoadKey, String otherParamKey]) {
    this.fileName =
         DateTime.now().millisecondsSinceEpoch.toString() + fileName;
    this.filePath = filePath;
    this.upLoadKey = upLoadKey;
    if (otherParamKey == null) {
      this.otherParamKey = 'data';
    } else {
      this.otherParamKey = otherParamKey;
    }
  }
}

class Http {
  //配置dio实例
  static BaseOptions options = BaseOptions(baseUrl: HttpConfig.instance.baseUrl);
  static Dio dio = new Dio(options);

  // ！ 需要本地代理抓包，需要在网络请求方法（httpRequest）方法首行中调用
  static dioinit() {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      // config the http client
      client.findProxy = (uri) {
        //proxy all request to localhost:8888
        return "PROXY localhost:8888";
      };
    };
  }

  /*
   * 基本数据请求
   * （1）支持基本的数据请求方法
   * 
   * （2）支持【multipart/form-data】方式的文件上传
   *  getApplicationDocumentsDirectory().then((value) async {
      var filepath = value.path;
      var file = HttpFile('1.png', '$filepath/1.png');
      Http.httpRequest('ssp_front/breach/submitphoto', {}, file)
          .then((result) {
        if (result.success) {
          print(result.data);
        } else {
          print(result.data);
        }
      });
    });
  */
  static Future<HttpResult> httpRequest(String api, Map<String, String> param,
      [HttpFile file]) async {
    // 基本网络请求参数构建
    var paramsMap = createRequestParam(param);
    dynamic requestParams;
    if (file != null) {
      FormData formData = FormData.fromMap({
        file.otherParamKey: convert.jsonEncode(paramsMap),
        file.upLoadKey: await MultipartFile.fromFile(file.filePath,
            filename: file.fileName),
      });
      requestParams = formData;
    } else {
      requestParams = paramsMap;
    }
    return dio.post(api, data: requestParams).then((response) {
      return handleResponse(response);
    }).catchError((error) {
      return HttpResult(false, '网络请求失败！');
    });
  }

  static HttpResult handleResponse(Response<dynamic> response) {
    if (response.statusCode == 200) {
      var data = response.data;
      if (data["code"] == '200') {
        return HttpResult(true, data["data"]);
      } else {
        return HttpResult(false, data["message"]);
      }
    } else {
      return HttpResult(false, '网络请求失败！');
    }
  }

  /*
   基本网络请求参数构建
 */
  static Map<String, String> createRequestParam(Map<String, String> param) {
    var paramsMap = new Map<String, String>();
    // 增加基本参数
    paramsMap['appId'] = HttpConfig.instance.appId;
    paramsMap['nonce'] = randomInteger(32);
    paramsMap['timestamp'] =
        new DateTime.now().millisecondsSinceEpoch.toString();
    // 添加业务基础参数
    if (param.keys.length > 0) {
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
    var signOrign =
        signString + 'secretKey' + '=' + HttpConfig.instance.secretKey;
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
