package MaxHeap;

public class MaxHeap<E extends Comparable<E>> {

    private Array<E> data;

    public MaxHeap(int capacity){
        data = new Array<E>(capacity);
    }

    public MaxHeap(){
        data = new Array<E>();
    }

    // 将任意的数组整理成堆的形状 Heapify
    public MaxHeap(E[] arr){
        data = new Array<E>(arr);
        for (int i = parent(arr.length - 1); i >= 0; i--){
            siftDown(i);
        }
    }

    // 返回堆中元素的个数
    public int size(){
        return data.getSize();
    }

    // 返回布尔值，表示堆中是否为空
    public boolean isEmpty(){
        return data.getSize() == 0;
    }

    // 返回完全二叉树的数组表示中，一个索引所表示的元素的父亲节点的索引
    private int parent(int index){
        if (index == 0){
            throw new IllegalArgumentException("index-0 doesn't have parent");
        }
        return (index - 1 ) / 2 ;
    }

    // 返回完全二叉树的数组表示中，一个索引所表示的元素的左孩子节点的索引
    private int leftChild(int index){
        return index * 2 + 1;
    }

    // 返回完全二叉树的数组表示中，一个索引所表示的元素的右孩子节点的索引
    private int rightChild(int index){
        return index * 2 + 2;
    }

    // 向堆中添加元素
    public void add(E e){
        data.addLast(e); // 将元素添加到末尾
        siftUp(data.getSize() - 1); // 将添加的元素与其根元素做比较，如果大于根节点的值，则交换与根节点的位置
    }
    private void siftUp(int k){
        while (k > 0 && data.get(k).compareTo(data.get(parent(k))) > 0){
            data.swap(k,parent(k));
            k = parent(k);// 更新索引
        }
    }

    // 查看堆中的最大元素
    public E findMax(){
        if (data.getSize() == 0){
            throw new IllegalArgumentException("can not findMax when heap is empty");
        }
        return data.get(0);
    }

    // 从堆中获取最大的元素，并且调整堆的结构
   public E extractMax(){
        E ret = findMax();

        data.swap(0,data.getSize() - 1);
        data.removeLast();

        siftDown(0); // 将新增的元素下沉

        return ret;
   }

   private void siftDown(int k){
        while (leftChild(k) < data.getSize()){
            int j = leftChild(k);
            // 当前右侧节点索引小于数组长度，并且 右子树节点的值大于当前结点
            if (j + 1 < data.getSize() && data.get(j + 1).compareTo(data.get(j)) > 0){
                j = rightChild(k);//
            }
            // data[j] 是leftchild和rightChild中的最大值
            if(data.get(k).compareTo(data.get(j)) >= 0){
                break;
            }
            data.swap(k,j);// 进行交换
            k = j;
        }
   }

   // 取出最大元素，再放入一个新元素 replace
    public E replace(E e){
        E ret = findMax();
        data.set(0,e); // 将首部元素替换，然后再执行siftdown即可
        siftDown(0);
        return ret;
    }

}
