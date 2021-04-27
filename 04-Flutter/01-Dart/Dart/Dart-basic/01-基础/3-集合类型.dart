void main(List<String> args) {
  // (1) List : 数组
  var arr1 = [1, 2, 3, 4, 5];
  var arr2 = new List.of(['a', 'b', 'c']);
  print('arr1:${arr1};arr2:${arr2}');
  //（1）reduce:将数组的元素依次处理
  var sum = arr1.reduce((value, element) {
    return value + element;
  });
  print("sum:${sum}");
  // (2)map : 将数组中的元素依次处理，返回一个新数组
  var newArr1 = arr1.map((ele) {
    return ele + 2;
  });
  print('newArr1:${newArr1}');
  // 数组的长度
  print('${arr1.length}');
  //
  // (2) Set : 集合 LinkedHashSet
  var set1 = {1, 2, 4};
  var set2 = new Set<String>();
  print('${set1.runtimeType},${set2.runtimeType}');

  // (3) Map : LinkedHashMap
  var map1 = {"key": "value"};
  var map2 = new Map<String, String>();
  map2['key1'] = 'value1';
  for (final key in map2.keys) {
    print("${key}:${map2[key]}");
  }
  print('${map1},${map2}');
}
