
import 'package:flutter/material.dart';

import 'models/business_model.dart';

class BusinessDetailPage extends StatelessWidget {
  const BusinessDetailPage({Key key, this.businessModel}) : super(key: key);
  final BusinessModel businessModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('BusinessDetailPage')),
        body: Text('BusinessDetailPage'));
  }
}