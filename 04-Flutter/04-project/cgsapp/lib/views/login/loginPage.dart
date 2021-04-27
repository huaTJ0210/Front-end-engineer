import 'dart:async';

import 'package:cgsapp/configs/apiName.dart';
import 'package:cgsapp/utils/http/http.dart';
import 'package:cgsapp/utils/http/httpConfig.dart';
import 'package:cgsapp/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
 LoginPage({Key key}) : super(key: key);

  Completer<WebViewController> _controller = Completer<WebViewController>();
  WebViewController _webViewController;

  Map<String, String> urlParmas(String url) {
    Map<String, String> params = {};
    var subURLS = url.split('?');
    if (subURLS.length > 1) {
      var subURL = subURLS[1];
      var subURLParams = subURL.split('&');
      for (var item in subURLParams) {
        var items = item.split('=');
        params[items[0]] = items[1];
      }
    }
    return params;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('登录')),
      body: WebView(
        initialUrl: HttpConfig.instance.loginUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
          _controller.complete(webViewController);
        },
        onPageFinished: (url) {},
        onWebResourceError: (error) {
          print(error.description);
        },
        navigationDelegate: (NavigationRequest request) {
          String url = request.url;
          var params = urlParmas(url);
          var token = params['token'];

          if (token != null) {
            // 执行登录操作
            Http.httpRequest(ApiName.loginApiName, {'token': token})
                .then((HttpResult result) {
              if (result.success) {
                var user = result.data as Map<String, dynamic>;
                UserModel.instance.modelWithJSON(map: user);
                Navigator.pop(context);
              } else {
                _webViewController.loadUrl(HttpConfig.instance.loginUrl);
              }
            });
            return NavigationDecision.prevent;
          } else {
            return NavigationDecision.navigate;
          }
        },
      ),
    );
  }
}
