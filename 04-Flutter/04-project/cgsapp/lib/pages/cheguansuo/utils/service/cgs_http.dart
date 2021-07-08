import 'package:cgsapp/framework/http/http.dart';
import 'package:cgsapp/framework/http/http_tools.dart';
import 'package:cgsapp/pages/cheguansuo/utils/config/cgs_config.dart';
import 'package:dio/dio.dart';

class CGSHttpSerice {

  static Future<dynamic> httpRequest(String apiName,
      {Map<String, dynamic> params}) async {
    var response =
        await Http.httpPostRequest(apiName, params, new CGSHttpInterceptors());
    return handleResponse(response);
  }

  static dynamic handleResponse(Response<dynamic> response) {
    if (response.statusCode == 200) {
      var data = response.data;
      if (data["code"] == '200') {
        return CGSHttpResult(true, data["data"]);
      } else {
        return CGSHttpResult(false, data["message"]);
      }
    } else {
      return CGSHttpResult(false, '网络请求失败！');
    }
  }
}

class CGSHttpInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 处理车管所的请求
    options.baseUrl = CGSHttpConfig.instance.baseUrl;
    options.data =
        HttpTools.createRequestParam(options.data, CGSHttpConfig.instance);
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return super.onError(err, handler);
  }
}

class CGSHttpResult {
  const CGSHttpResult(this.success, this.data);
  final bool success;
  final dynamic data;
}

/*
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
  static Future<HttpResult1> httpRequest(String api, Map<String, String> param,
      [HttpFile1 file]) async {
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
      return HttpResult1(false, '网络请求失败！');
    });
  }
*/
