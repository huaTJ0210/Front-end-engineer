
import 'package:cgsapp/framework/base_dart/object_model.dart';

class BusinessModel implements ObjectModel<BusinessModel> {
  num defaultSelectHandleTypeIndex;
  num businessId;
  String businessName;
  num forceRead;
  num readTime;
  String descLinkUrl;
  List<BusinessHandleType> handleTypeList;
  num handleSiteNumber;
  String guideLinkUrl;

  @override
  BusinessModel modelWithJSON({Map<String, dynamic> map, List list}) {
    var model = this;
    model.defaultSelectHandleTypeIndex = -1;
    model.businessId = map['businessId'];
    model.businessName = map['businessName'];
    var businessDetail = map['businessDetail'];
    model.handleSiteNumber = businessDetail['handleSiteNumber'];
    model.guideLinkUrl = businessDetail['guideLinkUrl'];
    var handleInstructions = map['handleInstructions'];
    model.forceRead = handleInstructions['forceRead'];
    model.readTime = handleInstructions['readTime'];
    model.descLinkUrl = handleInstructions['descLinkUrl'];
    model.handleTypeList = [];
    var handleTypes = map['handleType'] as List<dynamic>;
    for (var item in handleTypes) {
      var handleType = BusinessHandleType();
      handleType.name = item['handleTypeName'];
      handleType.id = item['handleTypeId'];
      switch (handleType.id) {
        case '100':
          {
            handleType.defaultIcon = 'icon_reserve_default@2x.png';
            handleType.selectedIcon = 'icon_reserve_select@2x.png';
          }
          break;
        case '110':
          {
            handleType.defaultIcon = 'icon_online_default@2x.png';
            handleType.selectedIcon = 'icon_online_select@2x.png';
          }
          break;
        case '120':
          {
            handleType.defaultIcon = 'icon_entrust_default.png';
            handleType.selectedIcon = 'icon_entrust_select@2x.png';
          }
          break;
        default:
      }
      model.handleTypeList.add(handleType);
    }

    return model;
  }

  // 首页默认展示数据
  static Map<String, dynamic> defaultModel() {
    return {
      'businessId': -1,
      'businessName': '请选择需要办理的业务',
      'businessDetail': {'handleSiteNumber': 1, 'guideLinkUrl': ''},
      'handleInstructions': {'forceRead': 0, 'readTime': 1, 'descLinkUrl': ''},
      'handleType': [
        {
          'handleTypeName': '预约办理',
          'handleTypeId': '100',
          'defaultIcon': 'icon_reserve_default@2x.png',
          'selectedIcon': 'icon_reserve_select@2x.png'
        },
        {
          'handleTypeName': '12123办理',
          'handleTypeId': '110',
          'defaultIcon': 'icon_online_default@2x.png',
          'selectedIcon': 'icon_online_select@2x.png'
        },
        {
          'handleTypeName': '委托办理',
          'handleTypeId': '120',
          'defaultIcon': 'icon_entrust_default.png',
          'selectedIcon': 'icon_entrust_select@2x.png'
        }
      ]
    };
  }
}

class BusinessHandleType {
  String name;
  String id;
  String defaultIcon;
  String selectedIcon;
}
