import 'package:cgsapp/configs/apiName.dart';
import 'package:cgsapp/pages/cheguansuo/utils/service/cgs_http.dart';
import 'package:flutter/material.dart';

import 'models/business_list_model.dart';

class BusinessTypeListPage extends StatefulWidget {
  BusinessTypeListPage({Key key}) : super(key: key);

  @override
  _BusinessTypeListPageState createState() => _BusinessTypeListPageState();
}

class _BusinessTypeListPageState extends State<BusinessTypeListPage>
    with SingleTickerProviderStateMixin {
  List<BusinessListModel> businessList = [];
  @override
  void initState() {
    super.initState();
    CGSHttpSerice.httpRequest(ApiName.businessListApiName)
        .then((dynamic result) {
      if (result.success) {
        var list = result.data;
        businessList.addAll(BusinessListModel.modelWithList(list));
        setState(() {});
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: businessList.length,
        child: Scaffold(
            backgroundColor: Color(0xFFF7F7F7),
            appBar: AppBar(
              title: Text('办理业务'),
              bottom: TabBar(
                  isScrollable: true,
                  tabs: businessList
                      .map((BusinessListModel model) =>
                          Tab(text: model.businessTypeName))
                      .toList()),
            ),
            body: TabBarView(
              children: businessList.map((BusinessListModel model) {
                return Container(
                    margin: EdgeInsets.only(top: 18, left: 16, right: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFFFFFFF)),
                    child: ListView.builder(
                        itemCount: model.businessList.length,
                        itemExtent: 60,
                        itemBuilder: (BuildContext context, int index) {
                          var businessModel = model.businessList[index];
                          return ListTile(
                              onTap: () {
                                Navigator.pop(context, businessModel);
                              },
                              title: Padding(
                                padding: EdgeInsets.only(top: 18, bottom: 18),
                                child: Text(
                                  '${businessModel.businessName}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF13133B),
                                      backgroundColor: Color(0xFFFFFFFF)),
                                ),
                              ));
                        }));
              }).toList(),
            )));
  }
}
