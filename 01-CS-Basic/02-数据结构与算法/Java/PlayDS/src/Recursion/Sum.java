package Recursion;

public class Sum {

    // 利用递归求解数加法
    public static int sum(int[] nums){
        return  sum(nums,0);
    }
    private static int sum(int[] nums,int left){
        // 拆解为最根本的问题
        if (left == nums.length)
            return 0 ;
        // 将问题的规模减小
        return nums[left] + sum(nums,left+1);
    }

     /*
     *   有100个台阶，一次走1步或者2步，总共有多少种走法
     * */
    public static int steps(int n){
        if (n == 1) return  1;
        if (n == 2) return  2;
        return steps(n-1) + steps(n-2);
    }

    public static void main(String[] args){
        int[] nums = {1,2,3,4,5,6};
        int sum = sum(nums);
        System.out.println(sum);
        System.out.println(steps(4));
    }
}
