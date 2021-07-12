/*
  (1) 深拷贝对象

  var obj = {
    name :'li',
    age ；18,
    address:['bj','sd','lc']
  }
*/
function deepClone(origin, target) {
  if (typeof origin !== 'object' || origin == undefined) {
    return origin;
  }
  var tar = target || {};
  var toString = Object.prototype.toString;
  var arrayType = '[object Array]';

  for (var key in origin) {
    if (origin.hasOwnProperty(key)) {
      var value = origin[key];
      if (typeof value === 'object' && value != null) {
        // [] 或者 {}
        tar[key] = toString.call(value) === arrayType ? [] : {};
        deepClone(value, tar[key]);
      } else {
        // 基本类型或者是function
        tar[key] = value;
      }
    }
  }
  return tar;
}

// (2)仿写Array的forEach

Array.prototype.myForEach = function (cb) {
  var _arr = this; //当前调用函数的数组
  var _len = _arr.length;
  var _bindThis = arguments[1] || window;

  for (var i = 0; i < _len; i++) {
    cb.apply(_bindThis, [_arr[i], i, _arr]);
  }
};

// (3)仿写Array的map
Array.prototype.myMap = function (cb) {
  var _arr = this;
  var _len = _arr.length;
  var _bindThis = arguments[1] || window;
  var _item;
  var _newArr = [];
  var _res;

  for (var i = 0; i < _len; i++) {
    //如果item是对象应该深复制
    _item = deepClone(_arr[i]);
    _res = cb.apply(_bindThis, [_item, i, _arr]);
    _res && _newArr.push(_res);
  }
  return _newArr;
};

// (4)仿写filter

Array.prototype.myFilter = function (cb) {
  var _arr = this;
  var _len = _arr.length;
  var _bingThis = arguments[1] || window;
  var _newArr = [];
  var _item;
  for (var i = 0; i < _len; i++) {
    _item = deepClone(_arr[i]);
    cb.apply(_bingThis, [_item, i, _arr]) ? _newArr.push(_item) : '';
  }
  return _newArr;
};

// (5) 仿写every
Array.prototype.myEvery = function (cb) {
  var _arr = this;
  var _len = _arr.length;
  var _bindThis = arguments[1] || window;
  var _res = true;
  for (var i = 0; i < _len; i++) {
    if (!cb.apply(_bindThis, [_arr[i], i, _arr])) {
      _res = false;
      break;
    }
  }
  return _res;
};
// (6) 仿写some
Array.prototype.mySome = function (cb) {
  var _arr = this;
  var _len = _arr.length;
  var _bindThis = arguments[1] || window;
  var _res = false;
  for (var i = 0; i < _len; i++) {
    if (cb.apply(_bindThis, [_arr[i], i, _arr])) {
      _res = true;
      break;
    }
  }
  return _res;
};

// (7) 仿写reduce
Array.prototype.myReduce = function (cb) {
  if (this == null) {
    throw new Error('Array.prototype.myReduce called on null or undefined');
  }
  if (typeof cb !== 'function') {
    throw new Error('cb is not a function');
  }
  var o = Object(this);
  var len = o.length >>> 0;
  var index = 0;
  var value;
  if (arguments.length >= 2) {
    value = arguments[1];// 有默认的initialValue
  } else {
    // 解决空数组和 存在length属性的对象
    while (index < len && !(index in o)) {
      index++;
    }
    if (index >= len) {
      throw new Error('reduce an empty array,and not supply a initialValue');
    }
    value = [index++];  // 如果存在数组只有一个元素或者没有初始化值，则将数组的第一个元素赋值给value
  }
  while (index < len) {
    if (index in o) {
      value = cb(value, o[index], index, o);
    }
    index++;
  }
  return value;
};

// (7) 仿写reduceRight
Array.prototype.myReduceRight = function (cb, initialValue) {
  var _arr = this;
  var _len = _arr.length;
  var _bindThis = arguments[2] || window;
  var _item;
  for (var i = _len - 1; i >= 0; i--) {
    if (!initialValue) {// 初始值不提供则使用第一个值
      initialValue = deepClone(_arr[i]);
      continue;
    }
    _item = deepClone(_arr[i]);
    initialValue = cb.apply(_bindThis, [initialValue, _item, i, _arr]);
  }
  return initialValue;
};
