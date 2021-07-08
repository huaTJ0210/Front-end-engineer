import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

class Md5 {
  static String md5Util(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
