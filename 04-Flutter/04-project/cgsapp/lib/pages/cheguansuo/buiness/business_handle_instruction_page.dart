import 'dart:async';

import 'package:cgsapp/framework/widgets/toast/toast_widget.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'models/business_model.dart';

class HandleInstructionsPage extends StatefulWidget {
  HandleInstructionsPage({Key key, this.model}) : super(key: key);
  final BusinessModel model;

  @override
  _HandleInstructionsPageState createState() => _HandleInstructionsPageState();
}

class _HandleInstructionsPageState extends State<HandleInstructionsPage> {
  // ignore: non_constant_identifier_names
  bool radio_button_checked = false;
  Completer<WebViewController> _controller = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              '办理须知',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            leading: FlatButton(
              child: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Container(
          child: Stack(
            // fit: StackFit.expand, //未定位widget占满Stack整个空间
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 112),
                  child: WebView(
                    initialUrl: widget.model.guideLinkUrl,
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller.complete(webViewController);
                    },
                    onPageFinished: (url) {
                      print(url);
                    },
                    onWebResourceError: (error) {
                      print(error.description);
                    },
                  )),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 6),
                    height: 112,
                    color: Color(0xFFF7F7F7),
                    child: Column(
                      children: [
                        Listener(
                          onPointerDown: (event) {
                            radio_button_checked = !radio_button_checked;
                            setState(() {});
                          },
                          child: Row(
                            children: [
                              radio_button_checked
                                  ? Icon(Icons.radio_button_checked)
                                  : Icon(Icons.radio_button_unchecked),
                              Expanded(
                                // row 和 column 是flex组件是无法滚动的，如果没有足够空间，会发生溢出操作
                                // 这种情况下，Expanded 或 Flexible 组件可用作长文本的自动换行。在 Flutter文档中 虽然没有明确说明，但是在主轴上如有内容超出空间， Expanded 和 Flexible 会自动换行到纵轴。
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(8, 6, 16, 6),
                                  child: Text(
                                    '我已充分了解各项规定，并承诺保证材料的真实性，同意该注意事项',
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF5C5C6B),
                                        height: 1.5),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: RaisedButton(
                              color: Color(0xFF1F73FF),
                              onPressed: () {
                                if (!radio_button_checked) {
                                  ToastWidget.show(msg: '请先选择遵守协议');
                                  return;
                                }
                              },
                              child: Text('下一步',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700)),
                            ))
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
