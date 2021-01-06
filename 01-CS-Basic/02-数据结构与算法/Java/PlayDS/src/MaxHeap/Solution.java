package MaxHeap;
import java.util.TreeMap;
import java.util.PriorityQueue;

public class Solution {

    private class Freq implements Comparable<Freq>{
        public  int e ; // 节点的值
        public  int freq; // 节点出现的次数

        public Freq(int e , int freq){
            this.e = e;
            this.freq = freq;
        }

        @Override
        public int compareTo(Freq o) {
            if (this.freq < o.freq){
                return -1;
            }else if (this.freq > o.freq){
                return 1;
            }else{
                return 0;
            }
        }
    }

    /*
    *  给定一个非空的整数数组，返回其中出现频率前 k 高的元素。
    *  输入: nums = [1,1,1,2,2,3], k = 2
      输出: [1,2]
    * */
    public int[] topKFrequent(int[] nums, int k){
        TreeMap<Integer,Integer> map = new TreeMap<>();
        for (int num:nums){
            if (map.containsKey(num)){
                map.put(num,map.get(num) + 1);
            }else {
                map.put(num, 1);
            }
        }
        // 创建优先队列
        PriorityQueue<Freq> pq = new PriorityQueue<Freq>();
        for (int key: map.keySet()){
            if (pq.size() < k){
                pq.add(new Freq(key,map.get(key)));
            }else if (map.get(key) > pq.peek().freq){//
                pq.remove();
                pq.add(new Freq(key,map.get(key)));
            }
        }
        //
        int[] ret = new int[k];
        for (int i = k - 1; i >=0 ; i--) {
            ret[i] = pq.poll().e;
        }
        return ret;
    }
}