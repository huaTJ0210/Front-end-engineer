import 'package:flutter/material.dart';

class RecordsPage extends StatefulWidget {
  RecordsPage({Key key}) : super(key: key);

  @override
  _RecordsPageState createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('RecordsPage')), body: Text('RecordsPage'));
  }
}
