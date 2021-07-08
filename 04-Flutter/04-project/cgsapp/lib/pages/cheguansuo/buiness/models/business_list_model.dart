import 'package:cgsapp/framework/base_dart/object_model.dart';
import 'business_model.dart';

class BusinessListModel implements ObjectModel<BusinessListModel> {
  String businessTypeName;
  String businessTypeCode;
  List<BusinessModel> businessList;
  @override
  BusinessListModel modelWithJSON({Map<String, dynamic> map, List list}) {
    businessTypeName = map['businessTypeName'];
    businessTypeCode = map['businessTypeCode'];
    var list = map['businessList'];
    businessList = [];
    for (var item in list) {
      var businessModel = BusinessModel().modelWithJSON(map: item);
      businessList.add(businessModel);
    }
    return this;
  }

  static List<BusinessListModel> modelWithList(List<dynamic> list) {
    List<BusinessListModel> businessList = [];
    for (var item in list) {
      var businessListModel = BusinessListModel().modelWithJSON(map: item);
      businessList.add(businessListModel);
    }
    return businessList;
  }
}
