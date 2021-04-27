/*
  类型定义（方法类型别名）：取别名使得函数保留类型信息

*/

typedef Compare = int Function(Object a, Object b); // 使用typedef显示保留函数的信息

class SortedCollection {
  Compare compare;
  SortedCollection(this.compare);
}

int sort(Object a, Object b) => 0;

void main() {
  SortedCollection coll = SortedCollection(sort);
  if (coll.compare is Function) {
    print('coll.compare is Function');
  }
  if (coll.compare is Compare) {
    print('coll.compare is Compare');
  }
}
