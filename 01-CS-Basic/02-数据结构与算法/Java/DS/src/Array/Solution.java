package Array;

import java.util.HashMap;
import java.util.Map;

/*
*   给定 nums = [2, 7, 11, 15], target = 9
    因为 nums[0] + nums[1] = 2 + 7 = 9
    所以返回 [0, 1]
* */
public class Solution {
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
