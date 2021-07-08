// 分而治之
function sum(arr) {
  if (arr.length === 0) {
    return 0;
  } else {
    return arr.shift() + sum(arr);
  }
}

// console.log(sum([1, 2, 3, 4, 5, 6]));

/*
  快速排序：不选第一个数字为基准数字的算法时间复杂度；
   (1) 对n进行分层；最多有logn层
  （2） 每层需要执行n次
  （3）所以时间复杂度为 O（nlogn）
  快速排序最糟糕的情况下是O（n^2）： 列表本身有序，且选择的基准数始终是数组的第一个


  快速排序的算法步骤：
  （1）选择数组中间的位置的数字--base；
  （2）遍历数组大于等于base的数字放在大数的数组中，小于base的数字放在小数数组中;
  中间需要排除base
  (3)采用分而治之的方式分别在排序小数数组和大数数组
*/
function quick_sort(array) {
  if (array.length < 2) {
    return array;
  } else {
    const middle = Math.floor(array.length / 2);
    const pivot = array[middle];
    let lessArray = [];
    let greaterArray = [];
    for (let i = 0; i < array.length; i++) {
      const current = array[i];
      if (i === middle) {
        continue;
      }
      if (current <= pivot) {
        lessArray.push(current);
      } else {
        greaterArray.push(current);
      }
    }
    return quick_sort(lessArray) + [pivot] + quick_sort(greaterArray);
  }
}

console.log(quick_sort([3, 4, 2, 1, 6, 5, 7, 9, 8]));

// 分割长方形为等大的正方形
function splitRectangle(width, height) {
  if (width === height) {
    return [width];
  } else {
    const x = Math.max(width, height);
    const y = Math.min(width, height);
    const w = x - Math.floor(x / y) * y;
    const h = y;
    if (w === 0 || h === 0) {
      return [Math.max(w, h)];
    } else {
      return [Math.min(width, height)].concat(splitRectangle(w, h));
    }
  }
}
const widths = splitRectangle(640, 1680);
console.dir(widths);
