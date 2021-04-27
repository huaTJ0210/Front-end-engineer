abstract class PrintHelper{
  printInfo() => print(getInfo());
  getInfo();
}

class Meta{
  double price;
  String name;
  Meta(this.name,this.price);
}

// 商品Item类
class Item extends Meta {
  Item(name,price) : super(name,price);

  Item operator +(Item item) => Item(item.name , price + item.price);
}

// 定义一个购物车类
class ShoppingCart extends Meta with PrintHelper{
  DateTime date;
  String code;
  int productCount;
  List<Item> bookings;
  
  /*
   reduce函数接受一个callback函数对集合的每个元素都执行
   callback包含4各参数
   1、previousValue （上一次调用回调返回的值，或者是提供的初始值（集合首个元素））
    2、currentValue （数组中当前被处理的元素）
    3、index （当前元素在数组中的索引）
    4、array （调用 reduce 的数组）
  * */
  double get price => bookings.reduce((value,element) => value + element).price;
  int get count => bookings.length;
// withCode 命名初始化方法 ，构造函数初始化列表
  ShoppingCart.withCode({name, this.code}) 
  : date  = DateTime.now(),
   productCount = 0,
   super(name,0);  

  ShoppingCart({name}) : this.withCode(name:name,code:null);

  String printShoppingList(){
     
     return "";
  }
  
  @override
  getInfo() {
    return '购物车信息：' +
        '\n ----------------' +
        '\n 用户名：$name' +
        '\n 优惠码：${code ?? "无"}' +
        '\n 商品名称列表：' +
        '${'11'}'
        '\n 总价：${price.toString()}' +
        '\n 购买数量：${count.toString()}' +
        '\n 日期：${date.toString()}' +
        '\n ----------------';
  }
}

void main(List<String> args) {
  // 级联调用法
  ShoppingCart.withCode(name: '张三',code: '12345')
  ..bookings = [Item('apple', 10.0),Item('orange', 15.0)]
  ..printInfo();

  ShoppingCart(name: '李四')
  ..bookings = [Item('banana', 13.6),Item('melonWater', 8.88)]
  ..printInfo();

}
