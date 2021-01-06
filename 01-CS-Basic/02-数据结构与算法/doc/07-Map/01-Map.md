### 字典（Map）

#### 1、什么是字典？

> 存储键值数据对的数据结构；根据key获取指定的value；

#### 2、字典接口

```java
 public interface Map<K,V> {
    public void add(K key,V value);
    public V remove(K key);
    public boolean contains(K key);
    public V get(K key);
    public void set(K key, V value);
    public int getSize();
    public boolean isEmpty();
}
```

