import 'package:cgsapp/pages/cheguansuo/utils/service/cgs_http.dart';

class HomeService {
  static String bannerApiName = "/cgsfront/home/getHomePicture";

  static Future<dynamic> getHomeBanners() async {
    // 首页
    var result = await CGSHttpSerice.httpRequest(bannerApiName);
    return result;
  }
}
