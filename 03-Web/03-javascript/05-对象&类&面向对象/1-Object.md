## 对象

#### 1.1 概念

> 对象包含一系列的属性，这些属性都是无序的；每个属性都有一个字符串key和对应的value


#### 1.2 对象创建

```javascript
//（1）构造函数创建
let obj1 = new Object();
obj1.name = "zz";

// (2) 对象创建--字面量
let obj = {
  x:1,
  y:2,
  z:{
    o:3,
    n:4
  }
} 

/*
  (3) 表达式还是语句？
  JavaScript 引擎读到上面这行代码，会发现可能有两种含义。
  第一种可能是，这是一个表达式，表示一个包含foo属性的对象；
  第二种可能是，这是一个语句，表示一个代码区块，里面有一个标签foo，指向表达式123。
  为了避免歧义，JavaScript引擎一律解释为代码块
*/ 
{foo:123}

/*
  如果要解释为对象，最好在大括号前加上圆括号。因为圆括号的里面，只能是表达式
  以上差异在eval语句（作用是对字符串求值）中反映得最明显。
*/
eval('{foo: 123}') // 123
eval('({foo: 123})') // {foo: 123}
```

#### 1.3 对象属性

> 对象中除了基本属性构成外，每个属性还有对应的标签，决定属性的特性；

##### 1.3.1 属性读写

```javascript
let obj = {
  x:1,
  y:2
}
obj.x; // 1
obj["y"];// 2 : 使用下标法，属性名必须是字符串
obj["x"] = 3；
obj.y = 4;

// 使用for...in遍历属性: 属性无序、同时会把原型对象上的属性遍历出来
var p;
for(p in obj){
  console.log(obj[p]);
}
```

##### 1.3.2 属性读写-异常

```javascript
let obj = {
  x:1
}
obj.y; // undefined
var yz = obj.y.z;// TypeError：cannot read property'z'of undefined
//取值之前先进行类型判断
var yz;
if(obj.y){
  yz = obj.y.z;
}
// 或者如下方式
var yz = obj && obj.y && obj.y.z

```

##### 1.3.3 属性删除

```javascript
let person = {
  age : 28,
  title:'fe'
}
// 删除属性
delete person.age;// true : 代表执行删除操作成功
delete person['title'];// true

person.age;// undefined 代表对象上已不存在该属性
delete person.age;//true :仅仅表示执行删除操作成功

delete Object.prototype;// false :不允许删除
// 获取指定对象属性的标签
var descriptor = Object.getOwnPropertyDescriptor(Object,'prototype');
descriptor.configurable;//false

```

##### 1.3.4 属性检测

```javascript
var cat = new Object();
cat.legs = 4;
cat.name = 'Kitty';

// (1)判断属性是否属于某一个对象(包含原型对象)
'legs' in cat; // true
'abc' in cat; // false
'toString' in cat;// true,inherited property
// (2) 判断属性是否属于某一个对象(不包含原型对象)
cat.hasOwnProperty('legs');// true
cat.hasOwnProperty('toString');//false
// (3) 自定义对象属性: 给cat对象增加一个price属性，并且该属性是可枚举的，值为1000
Object.defineProperty(cat,'price',{enumerable:false,value:1000});
cat.propertyIsEnumerable('price');//false

if(cat&&cat.legs){
   cat.legs *=2;
}

if(cat.legs!=undefined){
  // !==undefined,or,!==null
}

```

##### 1.3.5 属性枚举

```javascript
var o = {
  x:1,
  y:2,
  z:3
};
'toString' in o;//true
o.propertyIsEnumerable('toString');//false
var key;
for(key in o){
  console.log(key);//x,y,x
}

// 使用Object.create()创建对象
var obj = Object.create(o);// obj的原型对象就是o
// 打印可枚举的属性，包含obj的原型对象的属性
var key;
for(key in obj){
 console.log(key); // a,x,y,z
}
// 打印obj本身包含的对象
var key;
for(key in obj){
  if(obj.hasOwnProperty(key)){
    console.log(key);//a
  }
}

```

##### 1.3.6 属性的getter和setter方法

```javascript
var man = {
  name:'li',
  weibo:'li',
  $age:null,// 内部属性不向外部暴露
  get age(){
    if(this.$age == undefined){
      // 这里不用 === 当this.$age 为null是仍然成立
      return new Date.getFullYear() - 1990;
    }else{
      return this.$age;
    } 
  },
  set age(val){
    val = +val;// 如果val不是整数类型，可进行类型转化
    console.log('Age can\'t be set to ' + val);
  }
}
// 取值
console.log(man.age);//30
// 赋值
man.age = 100;// Age can't be set to 100
```


##### 1.3.7 属性标签-属性的权限设置

```javascript
// 函数的第一个参数是对象，第二个参数是属性名称
Object.getOwnPropertyDescriptor({pro:true},'pro');
// 以上函数的结果为：
Object{
  value:true, // 有值
  writable:true, // 属性值可以修改
  enumerable:true, // 该属性可以枚举
  configurable:true // 该属性可以使用delete删除
}

// 定义一个属性
var person = {};
Object.defineProperty(person,'name',{
  configurable:false,
  writable:false,
  enumerable:true,
  value:'li'
});

Object.defineProperty(person,'type',{
  configurable:true,
  writable:true,
  enumerable:false,
  value:'Object'
});

// 因为type属性设置为不可枚举，因此，函数的值只有name
Object.keys(person); // ["name"]

```

##### 1.3.8 对象标签-class标签

> class标签代表对象属于哪种类型

```javascript
// 拿到toString函数
var toString = Object.prototype.toString;
// 定义getType获取对象的类型
function getType(o){
  return toString.call(o).slice(8,-1);
}
//获取对象的类型
toString.call(null);//[object Null]
getType(null);// Null
getType(undefined);//Undefined
getType(1);//Number
getType(new Number(1));//Number
typeof new Number(1);//object
getType(true);//Boolean
getType(new Boolean(true));//Boolean
```

##### 1.3.9 对象序列化

```javascript
var obj = {
  x:1,
  y:true,
  z:[1,2,3],
  nullVal:null
};
// 将对象序列化为字符串
JSON.stringify(obj);// "{"x":1,"y":true,"z":[1,2,3],"nullVal":null}"

obj ={
  val:undefined, // 序列化时该属性将会被忽略
  a:NaN,
  b:Infinity,
  c:new Date()
}
JSON.stringify(obj);// "{"a":null,"b":null,"c":"2020-02-18T21:02"}"

// 将字符串转化为对象
Obj = JSON.parse('{"x":1}');
obj.x;//1

// 序列化自定义
var obj = {
  x:1,
  y:2,
  o:{
    o1:1,
    o2:2,
    toJSON:function(){
      return this.o1 + this.o2;
    }
  }
};
JSON.stringify(obj);// "{"x":1,"y":2,"o":3}"

```

##### 1.3.10 其他对象方法

```javascript
var obj = {
  x:1,
  y:2
};

obj.toString();//"[object,object]"
obj.toString = function(){
 return this.x + this.y;
}

"Result" + obj;//"Result 3"
+obj;//3 ,from toString

obj.valueOf = function(){
 return this.x + this.y + 100;
}
+obj;//103,from valueOf
"Result" + obj;// still "Result 103"
```

#### 
