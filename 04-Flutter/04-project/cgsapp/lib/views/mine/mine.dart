import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('我的'),
          backgroundColor: Color(0xFF1F73FF),
        ),
        body: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              Stack(alignment: Alignment.center, children: [
                Container(
                    color: Colors.grey[200],
                    width: double.infinity,
                    height: 400),
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(color: Color(0xFF1F73FF), height: 150)),
                Positioned(
                    top: 50,
                    left: 32,
                    right: 32,
                    child: Container(
                      height: 240,
                      padding: EdgeInsets.only(top: 60),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        children: [
                          Text(
                            '张三',
                            style: TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 20,
                                height: 1.4,
                                fontWeight: FontWeight.w700),
                          ),
                          Text('158******22',
                              style: TextStyle(
                                  color: Color(0xFF85859A),
                                  fontSize: 16,
                                  height: 1.4,
                                  fontWeight: FontWeight.w700)),
                          Column(
                            children: [
                              Listener(
                                  onPointerDown: (event) {
                                    Navigator.pushNamed(
                                        context, 'certificateListPage');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF1F5FC),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    height: 72,
                                    margin: EdgeInsets.only(
                                        left: 16, right: 16, top: 24),
                                    padding:
                                        EdgeInsets.only(left: 22, right: 0),
                                    child: Row(
                                      children: [
                                        Image.asset('images/icon_paper@2x.png',
                                            height: 29, width: 29),
                                        Padding(
                                          padding: EdgeInsets.only(left: 16),
                                          child: Text('我的证件',
                                              style: TextStyle(
                                                  color: Color(0xFF333333),
                                                  fontSize: 18,
                                                  height: 1.4,
                                                  fontWeight: FontWeight.w700)),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )),
                Positioned(
                  top: 16,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      width: 76,
                      height: 67,
                      color: Colors.lightGreen[100],
                    ),
                  ),
                )
              ]),
            ],
          ),
        ));
  }
}
