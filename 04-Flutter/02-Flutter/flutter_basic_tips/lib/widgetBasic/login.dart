import 'package:flutter/material.dart';

class BasicLogin extends StatelessWidget {
  // 用户名
  final TextEditingController _usenameController = TextEditingController();
  // 密码
  final TextEditingController _pwdController = TextEditingController();

  void _login() {
    //
    var userName = _usenameController.text;
    var pwd = _pwdController.text;
    print(userName + ":" + pwd);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('登录')),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            TextField(
                controller: _usenameController,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: '用户名或者邮箱', prefixIcon: Icon(Icons.person))),
            TextField(
                controller: _pwdController,
                autofocus: true,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '密码',
                  prefixIcon: Icon(Icons.lock),
                )),
            FlatButton(
              onPressed: _login,
              child: Text('登录'),
              color: Colors.blueAccent,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            Container(
              margin: EdgeInsets.all(50),
              height: 200,
              width: 200,
              child: Column(
                children: [
                  Text(
                    "文本是系统中常见的控件",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.red),
                  )
                ],
              ),
            )
          ]),
        ));
  }
}
