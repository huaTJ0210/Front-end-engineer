### 集合（Set）

#### 1、什么是集合？

> 数据构成的一个集体，但集合中的元素具有互斥性，即不允许重复元素的出现；

#### 2、集合接口

```java
public interface Set<E> {
    public int getSize();
    public boolean isEmpty();
    public void add(E e);
    public boolean contains(E e);
    public void remove(E e);
}
```

