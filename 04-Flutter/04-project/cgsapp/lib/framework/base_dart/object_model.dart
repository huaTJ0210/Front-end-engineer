// 定义公共model协议
abstract class ObjectModel<T> {
  T modelWithJSON({Map<String, dynamic> map, List<dynamic> list});
}
