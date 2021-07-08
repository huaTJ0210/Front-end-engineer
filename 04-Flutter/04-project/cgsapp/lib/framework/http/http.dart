import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';

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
    this.fileName = DateTime.now().millisecondsSinceEpoch.toString() + fileName;
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
  static Dio dio = new Dio();

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

  static Future<dynamic> httpRequest(String apiName, Map<String, String> params,
      Interceptor interceptor) async {
    dio.interceptors.add(interceptor);
    return dio.get(apiName, queryParameters: params);
  }

  static Future<dynamic> httpPostRequest(String apiName,
      Map<String, String> params, Interceptor interceptor) async {
    dio.interceptors.add(interceptor);
    return dio.post(apiName, data: params);
  }
}
