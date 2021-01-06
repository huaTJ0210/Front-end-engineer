package Array;

import java.util.HashMap;
import java.util.Map;

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

    public int getCapacity(){
        return data.length;
    }

    //在指定的位置增加元素
    public void add(int index,E e){
        if (index < 0 || index > size){
            throw  new IllegalArgumentException("param is illegal");
        }
        if (size == data.length){
            resize(data.length * 2); // 数组已满，扩容为当前数组容量的2倍
        }
        if (size!=0){// 数组为空时直接赋值
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
        if (size == data.length/4&&data.length/2 !=0){ // 当数组中的元素个数减少到数组容量的1/2
            resize(data.length/2);
        }
        return temp;
    }
    // 删除指定位置的元素
    public void deleteArrayOfElement(E e){
        int index = find(e);
        if (index!=-1){
            delete(index);
        }
    }
    // 删除数组中指定的所有元素[]

    public  void deleteAllElementOfArray(E e){
        int j = 0;
        int delNums = 0;
       for(int i=0 ;i<size;i++){
           if(data[i]==e){
               delNums++;
               continue;
           }else{
               if(j!=i){
                   data[j] = data[i];
               }
               j++;
           }

       }
       size-=delNums;
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

/*
*   给定 nums = [2, 7, 11, 15], target = 9
    因为 nums[0] + nums[1] = 2 + 7 = 9
    所以返回 [0, 1]
* */
class Solution {
    public int[] twoSum(int[] nums, int target) {
        int[] res = new int[2];
        for(int i = 0; i < nums.length;i++){
            for ( int j= i+1 ; j < nums.length;j++){
                if (target == nums[i] + nums[j]){
                    res[0] = i;
                    res[1] = j;
                    break;
                }
            }
        }
        return res;
    }

    public int[] twoSum1(int[] nums, int target) {
        // 哈希表: 根据key获取存储的值时间复杂度是O(1);
        Map<Integer,Integer> hashTable = new HashMap<Integer, Integer>();
        for (int i = 0; i < nums.length; i++) {
            if (hashTable.containsKey(target - nums[i])){
                return  new int[]{hashTable.get(target - nums[i]),i};
            }
            hashTable.put(nums[i],i);
        }
        return new int[0];
    }


    public static  void main(String[]args){
        int[] nums  = {2,9,10,7,11,15};
        int[] res = new Solution().twoSum1(nums,9);
        for (int i = 0; i < res.length; i++) {
            System.out.println(res[i]);
        }
    }
}
