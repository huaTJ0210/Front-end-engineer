import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastWidget {
  static void show({String msg}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.grey[400],
        textColor: Colors.black,
        fontSize: 16.0);
  }
}
