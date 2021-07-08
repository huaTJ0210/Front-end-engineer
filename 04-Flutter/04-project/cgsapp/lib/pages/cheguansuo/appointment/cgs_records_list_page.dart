import 'package:flutter/material.dart';

class CGSRecordsListPage extends StatefulWidget {
  CGSRecordsListPage({Key key}) : super(key: key);

  @override
  _CGSRecordsListPageState createState() => _CGSRecordsListPageState();
}

class _CGSRecordsListPageState extends State<CGSRecordsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('CGSRecordsListPage')),
        body: Text('CGSRecordsListPage'));
  }
}
