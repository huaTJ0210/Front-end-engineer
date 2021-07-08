
import 'package:cgsapp/framework/base_dart/object_model.dart';

class CertificateModel implements ObjectModel<CertificateModel> {
  String certificateid;
  String name;
  String description;
  String icon;
  @override
  CertificateModel modelWithJSON({Map<String, dynamic> map, List list}) {
    this.certificateid = map['certificate_id'];
    this.name = map['name'];
    this.description = map['description'];
    this.icon = '';
    return this;
  }

  static List<CertificateModel> modelWithList(Map<String, dynamic> map) {
    List<CertificateModel> list = [];
    var idCard = map['id_card'];
    if (idCard != null) {
      var model = CertificateModel().modelWithJSON(map: idCard);
      list.add(model);
    }
    var driveCard = map['drive_card'];
    if (driveCard != null) {
      var model = CertificateModel().modelWithJSON(map: driveCard);
      list.add(model);
    }
    var vehicleCard = map['vehicle_card'];
    if (vehicleCard != null) {
      for (var item in vehicleCard) {
        var model = CertificateModel().modelWithJSON(map: item);
        list.add(model);
      }
    }
    return list;
  }
}
