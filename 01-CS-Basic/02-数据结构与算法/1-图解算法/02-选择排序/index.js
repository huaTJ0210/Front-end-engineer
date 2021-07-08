// 获取数组中最小的元素
function findSmallest(arr) {
  let smallest = arr[0];
  let smallestIndex = 0;
  for (let i = 1; i < arr.length; i++) {
    if (smallest > arr[i]) {
      smallest = arr[i];
      smallestIndex = i;
    }
  }
  return smallest;
}

// 选择排序: 每次将最大或者最小的元素选出了，放到数组的前面位置
function select_sort(arr) {
  for (let i = 0; i < arr.length; i++) {
    for (let j = i + 1; j < arr.length; j++) {
      if (arr[i] > arr[j]) {
        const temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
    }
  }
}

let arr = [2, 1, 3, 6, 4, 7, 9, 8, 5];
select_sort(arr);
console.log(arr);
