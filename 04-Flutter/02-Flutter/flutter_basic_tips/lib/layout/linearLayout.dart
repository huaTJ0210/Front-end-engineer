import 'package:flutter/material.dart';

class LinearLayout extends StatelessWidget {
  const LinearLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('线性布局')),
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('AAAA',
                        style: TextStyle(
                            fontSize: 15, backgroundColor: Colors.red)),
                    Text('BBB',
                        style: TextStyle(
                            fontSize: 15, backgroundColor: Colors.blue)),
                  ])),
          Column(
            children: <Widget>[
              Text('CCC',
                  style: TextStyle(fontSize: 15, backgroundColor: Colors.red)),
              Text('DDD',
                  style: TextStyle(fontSize: 15, backgroundColor: Colors.blue)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(20),
                title: Text('text'),
                subtitle: Text('detailText'),
                trailing: Icon(Icons.phone),
                leading: Icon(Icons.mail),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(12, 12, 0, 0),
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(width: 10, color: Colors.red)),
                child: Text(
                  'text message!!',
                  style: TextStyle(backgroundColor: Colors.yellow),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                child: Text('Padding text'),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.lightGreen)),
                height: 55,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 12,
                      ),
                      child: Image(
                          image: AssetImage('images/paizhao.png'),
                          width: 30,
                          height: 30),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 14,
                            margin: EdgeInsets.only(left: 12, top: 9),
                            child: Text(
                              '凯德茂商场',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Container(
                            height: 14,
                            margin: EdgeInsets.only(left: 12, top: 9),
                            child: Text(
                              '西城区25号楼114室',
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          )
                        ]),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
