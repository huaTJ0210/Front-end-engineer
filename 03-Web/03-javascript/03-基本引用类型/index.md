# 基本引用类型

## 1、Date

```javascript
  // 获取当前日期 x天后的日期 
  var myDate = new Date();
  myDate.setDate(myDate.getDate() + 12);
  console.log(myDate);
  var year = myDate.getFullYear();
  var month = myDate.getMonth() + 1;
  var day = myDate.getDate();
  console.log(year + "-" + month + "-" + day);
```



## 2、RegExp

```javascript
 /*
         https://blog.csdn.net/lxcnn/category_538256.html
      */
// （1）字面量定义正则表达式
var regExp = /cat/;
regExp.test('cat and dog');

// (2) 正则表达式带有g修饰，表示全局搜索[lastIndex表示正则表达式下一次开始搜索的开始位置]
var r = /x/g;
var s = '_x_x';
r.lastIndex; // 0
r.test(s); // true

r.lastIndex; // 2
r.test(s); // true

r.lastIndex; // 4
r.test(s); // false

/*
基本语法
   （1）\d : 匹配一个数字
   （2）\w ： 字母、数字、下划线 等价于：[a-zA-Z0-9_]
   （3）. ： 可以匹配任意字符(\n \r 除外)
   ----  规定字符的长度 ---
   （4）* ： 代表前面的字符出现 (0 - n) o* :
   （5）+ : 代表前面的字符出现（1 - n） o+ : 
   （6）？ ：0或者1个
   （7）{n}:表示n个字符
   （8）{n,m}:表示n-m个字符
   /\d{3}\s+\d{3,8}/
   --- 精准匹配 ----
   (1) [0-9a-zA-Z\_]可以匹配一个数字、字母或者下划线；
   (2) [0-9a-zA-Z\_]+可以匹配至少由一个数字、字母或者下划线组成的字符串，比如'a100'，'0_Z'，'js2015'等等；
   (3) [a-zA-Z\_\$][0-9a-zA-Z\_\$]*可以匹配由字母或下划线、$开头，后接任意个由一个数字、字母或者下划线、$组成的字符串，也就是JavaScript允许的变量名；
   (4) [a-zA-Z\_\$][0-9a-zA-Z\_\$]{0, 19}更精确地限制了变量的长度是1-20个字符（前面1个字符+后面最多19个字符
  --- 开头、结尾、 或 ---
  (1) ^表示行的开头，^\d表示必须以数字开头。
  (2) $表示行的结束，\d$表示必须以数字结束。
*/

// (1) 匹配 0 ~ 99的正整数
var regExp = /^(?:0|[1-9]\d)$/;
console.log(regExp.test(00));
```



## 3、Math

```javascript
// (1) 获取指定范围的字符串
function getRandomInt(min, max) {
   return Math.floor(Math.random() * (max - min + 1)) + min;
}
getRandomInt(1, 6); // 5

// （2）返回随机字符串
function random_str(length) {
  var ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  ALPHABET += 'abcdefghijklmnopqrstuvwxyz';
  ALPHABET += '0123456789-_';
  var str = '';
  for (var i = 0; i < length; ++i) {
    var rand = Math.floor(Math.random() * ALPHABET.length);
    str += ALPHABET.substring(rand, rand + 1);
  }
  return str;
}

random_str(6); // "NdQKOr"
```

### 4、JSON

```javascript
var obj = {
  name: 'li',
  age: 18,
  address: ['1', '2', '3']
};
var jsonStr = JSON.stringify(obj);
console.log(jsonStr);
var originObj = JSON.parse(jsonStr);
console.table(originObj);
```

