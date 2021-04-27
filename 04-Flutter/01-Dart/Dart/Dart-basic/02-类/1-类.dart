import 'dart:math';

void main(List<String> args) {
  //(1)静态函数
  var a = Point(2, 2);
  var b = Point(4, 4);
  var distance = Point.distanceBetween(a, b);
  print(distance);
}

class Point {
  num x, y;
  Point(this.x, this.y);
  
  // 【静态变量】: static 关键字修饰的变量
  // 【静态函数】:
  static num distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
}
