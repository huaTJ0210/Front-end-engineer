package SegmentTree;

/*
*  给定一个整数数组  nums，求出数组从索引 i 到 j（i ≤ j）范围内元素的总和，包含 i、j 两点。

实现 NumArray 类：

NumArray(int[] nums) 使用数组 nums 初始化对象
int sumRange(int i, int j) 返回数组 nums 从索引 i 到 j（i ≤ j）范围内元素的总和，包含 i、j 两点（也就是 sum(nums[i], nums[i + 1], ... , nums[j])）

*
* */

public class NumArray {

    private HZSegmentTree<Integer> segmentTree;

    public NumArray(int[] nums) {

        if (nums.length > 0){
            Integer[] data = new Integer[nums.length];
            for (int i = 0; i < data.length; i++) {
                data[i] = nums[i];
            }
            segmentTree = new HZSegmentTree<>(data,(a,b)->a+b);
        }

    }

    public void update(int i, int val) {

        segmentTree.set(i,val);
    }

    public int sumRange(int i, int j) {
        if (segmentTree==null){
            throw  new IllegalArgumentException("SegementTree is null");
        }
        return segmentTree.query(i,j);
    }
}
