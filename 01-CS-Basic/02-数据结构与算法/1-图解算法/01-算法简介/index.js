function binary_search(list, item) {
  let low = 0;
  let high = list.length - 1;
  while (low <= high) {
    // JavaScript中除法得到的是浮点数
    const middle = Math.floor((low + high) / 2);
    console.log('---:' + middle);
    const guess = list[middle];
    if (guess === item) {
      return middle;
    } else if (guess > item) {
      high = middle - 1;
    } else if (guess < item) {
      low = middle + 1;
    }
  }
  return -1;
}

const list = [1, 3, 5, 7, 9, 10];
const index = binary_search(list, 3);
console.log(index);
