public class Array<E> {
    private E[] data;
    private int size;

    public Array(int capacity){
        data = (E[])new Object[capacity];
        size = 0;
    }

    public Array(){
        this(10);
    }

    public int getSize(){
        return size;
    }

    public boolean isEmpty(){
        return size == 0;
    }

    public int getCapacity(){
        return data.length;
    }

    //在指定的位置增加元素
    public void add(int index,E e){
        if (index < 0 || index > size){
            throw  new IllegalArgumentException("index is illegal");
        }
        if (size == data.length){
            resize(data.length * 2); // 数组已满，扩容为当前数组容量的2倍
        }
        if (size!=0){
            //从数组尾端开始将元素一一后移
            for (int i = size - 1;i >= index;i--){
                data[i + 1] = data[i];
            }
        }
        data[index] = e;
        size++;
    }

    // 在数组头部添加元素
    public void addFirst(E e){
        add(0,e);
    }

    // 在数组末尾添加元素
    public void addLast(E e){
        add(size,e);
    }

    // 查询某个元素是否在数组中
    public boolean contains(E e){
        for (int i = 0;i < size;i++){
            if (data[i] == e){
                return true;
            }
        }
        return false;
    }
    // 找到第一个匹配的元素的位置
    // 若找到所有匹配的位置可以使用数组做保存{}
    public int find(E e){
        for (int i = 0; i < size ;i++){
            if (data[i] == e){
                return i;
            }
        }
        return -1;
    }

    // 删除指定元素
    public E delete(int index){
        if (index < 0 || index >= size){
            throw  new IllegalArgumentException("param is illegal");
        }
        E temp = data[index];
        for (int i = index;i < size-1;i++){
            data[i] = data[i+1];
        }
        size--;
        if (size == data.length/2){ // 当数组中的元素个数减少到数组容量的1/2
            resize(data.length/2);
        }
        return temp;
    }
    // 移除第一个元素
    public E removeFirst(){
        return delete(0);
    }
    // 移除最后一个元素
    public E removeLast(){
       return delete(size-1);
    }

    //
    public E get(int index){
        if (!isEmpty()){
            return  data[index];
        }else{
            return null;
        }
    }

    // 获取数组的第一个元素
    public  E getFirst(){
        if (!isEmpty()){
            return  data[0];
        }else{
            return null;
        }
    }

    // 获取数组的最后一个元素
    public  E getLast(){
        if (!isEmpty()){
            return  data[size - 1];
        }else{
            return null;
        }
    }

    // 删除指定位置的元素
    public void deleteArrayOfElement(E e){
        int index = find(e);
        if (index!=-1){
            delete(index);
        }
    }
    // 删除数组中指定的所有元素[]
    public void deleteAllElementOfArray(E e){
        deleteArrayOfElement(e);
        if (find(e)!=-1){
            deleteAllElementOfArray(e);
        }
    }

    // 扩容数组
    private void resize(int capacity){
        E[] resizeData = (E[])new Object[capacity];
        for (int i =0;i<size;i++){
            resizeData[i] = data[i];
        }
        data = resizeData;
    }

    @Override
    public String toString() {
        StringBuilder re = new StringBuilder();
        re.append(String.format("Array : size = %d  ,Capacity = %d\n",size,getCapacity()));
        re.append("[");
        for (int i = 0;i<size;i++){
            re.append(data[i]);
            if (i < size -1){
                re.append(",");
            }
        }
        re.append("]");
        return re.toString();
    }
}
