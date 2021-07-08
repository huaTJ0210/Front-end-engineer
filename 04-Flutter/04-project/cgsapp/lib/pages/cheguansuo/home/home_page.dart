import 'package:cgsapp/pages/cheguansuo/buiness/models/business_model.dart';
import 'package:cgsapp/pages/cheguansuo/home/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'models/banner_model.dart';
import 'widgets/business_select_widget.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  // （1）默认bannerModel
  var images = [
    BannerModel(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1936271708,2299077308&fm=26&gp=0.jpg',
        '')
  ];
  // (2)默认的businessModel
  var businessModel =
      BusinessModel().modelWithJSON(map: BusinessModel.defaultModel());
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    HomeService.getHomeBanners().then((result) => {
      // if (result.success) {
      //   setState(() {
      //     widget.images = BannerModel.listWithJson(result.data);
      //   });
      // }
    });

    super.initState();
  }

  void selectedBusinessAction(BusinessModel model) {
    if (model != null) {
      // 手势侧滑依旧会给Navigator.push返回值，触发返回操作的逻辑
      widget.businessModel = model;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 500,
              ),
              Container(
                height: 180,
                child: new Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return new Image.network(
                      widget.images[index].imageUrl,
                      fit: BoxFit.fill,
                    );
                  },
                  indicatorLayout: PageIndicatorLayout.COLOR,
                  autoplay: widget.images.length > 1,
                  itemCount: widget.images.length,
                  pagination: new SwiperPagination(
                      margin: EdgeInsets.only(bottom: 30),
                      builder: DotSwiperPaginationBuilder(
                          color: Colors.blue, activeColor: Colors.white)),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16, 154, 16, 0),
                child: BusinessWidget(
                    model: widget.businessModel,
                    selectedBusinessAction: selectedBusinessAction),
                height: 340,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1, //阴影范围
                        spreadRadius: 1, //阴影浓度
                        color: Color(0xFFF7F7F7), //阴影颜色
                      )
                    ]),
              )
            ],
          )
        ],
      ),
    ));
  }
}
