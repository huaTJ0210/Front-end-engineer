package SegmentTree;

/*
*  线段树
* */
public class HZSegmentTree<E> {

    private E[] tree; // 存储区间数据
    private E[] data;// 存储基本数据
    private Merger<E> merger;

    public HZSegmentTree(E[] arr,Merger<E> merger){
        this.merger = merger;
        data = (E[])new Object[arr.length];
        for (int i = 0; i < arr.length; i++) {
            data[i] = arr[i];
        }
        tree = (E[])new Object[4 * arr.length];
        buildSegmentTree(0,0,data.length - 1);
    }

    // 在TreeIndex的位置创建表示区间[l...r]的线段树
    private void buildSegmentTree(int treeIndex,int l ,int r){
        if (l == r){
            tree[treeIndex] = data[l];
            return;
        }
        int leftTreeIndex = leftChild(treeIndex);
        int rightTreeIndex = rightChild(treeIndex);

        int mid = l + (r - l) / 2; // 防止 r + l 整数的溢出
        buildSegmentTree(leftTreeIndex,l,mid);
        buildSegmentTree(rightTreeIndex,mid + 1,r);

        tree[treeIndex] = merger.merge(tree[leftTreeIndex],tree[rightTreeIndex]);
    }

    public int getSize(){
        return  data.length;
    }

    public E get(int index){
        if (index < 0 || index >= data.length){
            throw new IllegalArgumentException("Index is illegal");
        }
        return data[index];
    }

    // 返回完全二叉树的数组表示中，一个索引所表示的元素的左孩子节点的索引
    private int leftChild(int index){
        return 2*index + 1;
    }
    // 返回完全二叉树的数组表示中，一个索引所表示的元素的右孩子节点的索引
    private int rightChild(int index){
        return 2*index + 2;
    }

    // 返回区间[queryL,queryR]的值
    public E query(int queryL, int queryR){

        if (queryL < 0 || queryL >= data.length || queryR < 0 || queryR >= data.length || queryL > queryR){
            throw  new IllegalArgumentException("index is illegal");
        }

        return query(0,0,data.length - 1,queryL,queryR);
    }

    // 在以treeID为根的线段树中[l...r]的范围里，搜索区间[queryL,queryR]的值
    // [int treeIndex, int l, int r] 代表了一个结点的信息
    private E query(int treeIndex, int l, int r , int queryL , int queryR){

        if (l == queryL && r == queryR){
            return tree[treeIndex];
        }

        int mid = l + (r - l) / 2;
        int leftTreeIndex = leftChild(treeIndex);
        int rightTreeIndex = rightChild(treeIndex);

        if (queryL >= mid + 1){
            return query(rightTreeIndex,mid+1,r,queryL,queryR);
        }else if (queryR <= mid){
            return query(leftTreeIndex,l,mid,queryL,queryR);
        }
        // 当前的区间被分割两个部分分别放在左右孩子结点
        E leftResult = query(leftTreeIndex,l,mid,queryL,mid);
        E rightResult = query(rightTreeIndex,mid+1,r,mid+1,queryR);
        return  merger.merge(leftResult,rightResult);
    }

    // 更新数组中指定索引的数据，同时更新线段树
    public void set(int index , E e){
        if (index < 0 || index >= data.length){
            throw  new IllegalArgumentException("index is error");
        }
        data[index] = e;

        set(0,0,data.length-1,index,e);
    }

    // 在以treeIndex为根的线段树中更新data数组中index的值为e
    private void set(int treeIndex,int l,int r,int index,E e){
        if (l == r){
            tree[treeIndex] = e;
            return;
        }

        int mid = l + (r - l) / 2;
        int leftTreeIndex = leftChild(treeIndex);
        int rightTreeIndex = rightChild(treeIndex);

        if (index >= mid + 1){
            set(rightTreeIndex,mid+1,r,index,e);
        }else{
            set(leftTreeIndex,l,mid,index,e);
        }

        tree[treeIndex] = merger.merge(tree[leftTreeIndex] , tree[rightTreeIndex]);
    }


    @Override
    public String toString() {
        StringBuffer res = new StringBuffer();
        res.append("[");
        for (int i = 0; i < tree.length ; i++) {
            if (tree[i] != null){
                res.append(tree[i]);
            }else{
                res.append("null");
            }
            if (i != tree.length - 1){
                res.append(',');
            }
        }
        res.append("]");
        return res.toString();
    }

    public static  void main(String[] args){
        Integer[] nums = {-2,0,3,-5,2,-1};
        HZSegmentTree<Integer> segmentTree = new HZSegmentTree<>(nums, new Merger<Integer>() {
            @Override
            public Integer merge(Integer a, Integer b) {
                return a + b;
            }
        });
        System.out.println(segmentTree.toString());

        System.out.println(segmentTree.query(0,2));
    }
}
