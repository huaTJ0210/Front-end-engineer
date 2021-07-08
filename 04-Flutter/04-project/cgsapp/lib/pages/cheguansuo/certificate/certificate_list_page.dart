import 'package:flutter/material.dart';

class CertificateListPage extends StatefulWidget {
  CertificateListPage({Key key}) : super(key: key);

  @override
  _CertificateListPageState createState() => _CertificateListPageState();
}

Widget certificateWidget(BuildContext context, int index) {
  return Container(
    height: 90,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(10)),
    margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
    child: Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 15, top: 24),
              child: Image.asset(
                'images/icon_paper@2x.png',
                width: 25,
                height: 20,
              )),
          Padding(
              padding: EdgeInsets.only(left: 8, top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '驾驶证',
                    style: TextStyle(
                        fontSize: 16, height: 1.4, fontWeight: FontWeight.w700),
                  ),
                  Text('李小萌    1110**1124231',
                      style: TextStyle(
                          fontSize: 14,
                          height: 1.4,
                          color: Color(0xFF666666),
                          fontWeight: FontWeight.w700))
                ],
              )),
          Expanded(
            child: Text(''),
            flex: 1,
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 30, right: 16),
            child: Icon(Icons.chevron_right_sharp),
          )
        ],
      ),
    ),
  );
}

class _CertificateListPageState extends State<CertificateListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(title: Text('我的证件')),
        body: Container(
            margin: EdgeInsets.only(top: 16),
            child: CustomScrollView(
              slivers: [
                // 当列表项高度固定时，使用 SliverFixedExtendList 比 SliverList 具有更高的性能
                SliverFixedExtentList(
                    delegate: SliverChildBuilderDelegate(certificateWidget,
                        childCount: 3),
                    itemExtent: 100.0),
                // 如果不是Sliver家族的Widget，需要使用SliverToBoxAdapter做层包裹
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(top: 8, left: 16, right: 16),
                    height: 64,
                    decoration: BoxDecoration(
                        color: Color(0xFFF1F5FC),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          color: Color(0xFF4D68F0),
                        ),
                        Text('  添加证件',
                            style: TextStyle(
                                fontSize: 16,
                                height: 1.5,
                                color: Color(0xFF4D68F0),
                                fontWeight: FontWeight.w700))
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
