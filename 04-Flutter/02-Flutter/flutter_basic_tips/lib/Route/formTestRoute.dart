import 'package:flutter/material.dart';

class FormTestRoute extends StatefulWidget {
  FormTestRoute({Key key}) : super(key: key);

  @override
  _FormTestRouteState createState() => _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _usenameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('登录')),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16.0),
          child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  controller: _usenameController,
                  decoration: InputDecoration(
                      hintText: '用户名', icon: Icon(Icons.person)),
                  validator: (v) {
                    return v.trim().length > 0 ? null : '用户名不能为空';
                  },
                ),
                TextFormField(
                  controller: _pwdController,
                  decoration:
                      InputDecoration(hintText: '密码', icon: Icon(Icons.lock)),
                  validator: (v) {
                    return v.trim().length > 5 ? null : '密码不能少于6位';
                  },
                ),
                Padding(
                    padding: EdgeInsets.only(top: 28),
                    child: Row(children: <Widget>[
                      Expanded(
                          child: RaisedButton(
                              padding: EdgeInsets.all(15.0),
                              child: Text('登录'),
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              onPressed: () {
                                if ((_formKey.currentState as FormState)
                                    .validate()) {
                                      // 发送login
                                    }
                              }))
                    ]))
              ],
            ),
          ),
        ));
  }
}
