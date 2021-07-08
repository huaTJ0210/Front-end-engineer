import 'package:cgsapp/framework/base_dart/object_model.dart';

class BannerModel implements ObjectModel<BannerModel> {
  String imageUrl;
  String detailUrl;

  BannerModel(this.imageUrl, this.detailUrl);

  static List<BannerModel> listWithJson(List<dynamic> list) {
    var bannerList = List<BannerModel>();
    for (var item in list) {
      var imageUrl = item['imageUrl'];
      var detailUrl = item['detailUrl'];
      var bannerModel = new BannerModel(imageUrl, detailUrl);
      bannerList.add(bannerModel);
    }
    return bannerList;
  }

  @override
  BannerModel modelWithJSON({Map<String, dynamic> map, List list}) {
    return null;
  }
}
