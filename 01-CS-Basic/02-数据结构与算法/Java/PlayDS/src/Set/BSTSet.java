package Set;

import java.util.*;

public class BSTSet<E extends Comparable<E>> implements Set<E> {

    private BSTree<E> bsTree;

    public BSTSet(){
        bsTree = new BSTree<E>();
    }

    @Override
    public int getSize() {
        return bsTree.size();
    }

    @Override
    public boolean isEmpty() {
        return bsTree.isEmpty();
    }

    @Override
    public void add(E e) {
        bsTree.add(e);
    }

    @Override
    public boolean contains(E e) {
        return bsTree.constains(e);
    }

    @Override
    public void remove(E e) {
        bsTree.remove(e);
    }


    /*
    *   leetCode 804:
    *   例如:
   输入: words = ["gin", "zen", "gig", "msg"]
   输出: 2
   解释:
   各单词翻译如下:
   "gin" -> "--...-."
   "zen" -> "--...-."
   "gig" -> "--...--."
   "msg" -> "--...--."

    共有 2 种不同翻译, "--...-." 和 "--...--.".

    *
    * */
    public int uniqueMorseRepresentations(String[] words) {
        String[] codes = {".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."};
        HashSet set = new HashSet();
        for (String word:words){
            StringBuilder res = new StringBuilder();
            for (int i = 0; i < word.length(); i++) {
                int index = word.charAt(i) - 'a';
                res.append(codes[index]);
            }
            set.add(res.toString());
        }
        return set.size();
    }

    /*
    *   给定两个数组，编写一个函数来计算它们的交集。
    *   输入：nums1 = [1,2,2,1], nums2 = [2,2]
        输出：[2]
    * */
    public int[] intersection(int[] nums1, int[] nums2) {
        HashSet<Integer> set1 = new HashSet<Integer>();
        HashSet<Integer> set2 = new HashSet<Integer>();
        for (int num : nums1) {
            set1.add(num);
        }
        for (int num : nums2) {
            set2.add(num);
        }
        return getIntersection(set1, set2);
    }

    public int[] getIntersection(HashSet<Integer> set1, HashSet<Integer> set2) {
        if (set1.size() > set2.size()) {
            return getIntersection(set2, set1);
        }
        HashSet<Integer> intersectionSet = new HashSet<>();
        for (int num : set1) {
            if (set2.contains(num)) {
                intersectionSet.add(num);
            }
        }
        int[] intersection = new int[intersectionSet.size()];
        int index = 0;
        for (int num : intersectionSet) {
            intersection[index++] = num;
        }
        return intersection;
    }

    // 如果两个数组是有序的，则可以使用双指针的方法得到两个数组的交集。
    public int[] intersection1(int[] nums1, int[] nums2) {
        Arrays.sort(nums1);
        Arrays.sort(nums2);
        int length1 = nums1.length, length2 = nums2.length;
        int[] intersection = new int[length1 + length2];
        int index = 0, index1 = 0, index2 = 0;
        while (index1 < length1 && index2 < length2) {
            int num1 = nums1[index1], num2 = nums2[index2];
            if (num1 == num2) {
                // 保证加入元素的唯一性
                if (index == 0 || num1 != intersection[index - 1]) {
                    intersection[index++] = num1;
                }
                index1++;
                index2++;
            } else if (num1 < num2) {
                index1++;
            } else {
                index2++;
            }
        }
        return Arrays.copyOfRange(intersection, 0, index);
    }

     /*
    *   给定两个数组，编写一个函数来计算它们的交集。{允许有重复元素}
    *   输入：nums1 = [1,2,2,1], nums2 = [2,2]
        输出：[2,2]
    * */

    public int[] intersection2(int[] nums1, int[] nums2) {
        TreeMap<Integer,Integer> map = new TreeMap<>();
        for (int num:nums1){
            if (!map.containsKey(num)){
                map.put(num,1);
            }else {
                map.put(num,map.get(num) + 1);
            }
        }
        ArrayList<Integer> list = new ArrayList<>();
        for (int num:nums2){
            if (map.containsKey(num)){
                list.add(num);
                map.put(num,map.get(num) - 1);
                if (map.get(num) == 0){
                    map.remove(num);
                }
            }
        }
        int[] res = new int[list.size()];
        for (int i = 0; i < list.size(); i++) {
            res[i] = list.get(i);
        }
        return res;
    }

    public int[] intersect3(int[] nums1, int[] nums2) {
        if (nums1.length > nums2.length) {
            return intersect3(nums2, nums1);
        }
        Map<Integer, Integer> map = new HashMap<Integer, Integer>();
        for (int num : nums1) {
            int count = map.getOrDefault(num, 0) + 1;
            map.put(num, count);
        }
        int[] intersection = new int[nums1.length];
        int index = 0;
        for (int num : nums2) {
            int count = map.getOrDefault(num, 0);
            if (count > 0) {
                intersection[index++] = num;
                count--;
                if (count > 0) {
                    map.put(num, count);
                } else {
                    map.remove(num);
                }
            }
        }
        return Arrays.copyOfRange(intersection, 0, index);
    }


}
