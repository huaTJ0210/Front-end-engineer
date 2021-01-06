package LinkList;

public class Solution {
    // 判断单链表中是否存在环
    public boolean hasCycle(ListNode head) {
        boolean flag = false;
        ListNode fast = head;
        ListNode slow = head;
        while (fast !=null && fast.next !=null){
            fast = fast.next.next;
            slow = slow.next;
            if (fast == slow) {
                flag = true;
                break;
            }
        }
        return flag;
    }

    // 获取单链表第一次入环的结点
    public ListNode getFirstNodeInCycle(ListNode head) {
        if(head == null) {
            return null;
        } else {
            ListNode fast = head;
            ListNode slow = head;
            while(fast != null && fast.next != null) {
                slow = slow.next;
                fast = fast.next.next;
                if(fast == slow){
                    //有环，则返回环的第一个节点
                    slow = head;
                    while(slow != fast){
                        slow = slow.next;
                        fast = fast.next;
                    }
                    return slow;
                }
            }
            return null;
        }
    }

    // 求环的长度
    public int cycleLength(ListNode head) {
        int meet = 0;
        int length = 0;
        ListNode fast = head;
        ListNode slow = head;
        while (fast !=null && fast.next !=null){
            fast = fast.next.next;
            slow = slow.next;
            if (fast == slow) {
                meet ++;
            }
            if (meet == 1){
                length ++;
            }
            if (meet == 2){
                break;
            }
        }
        return length;
    }
}

class ListNode{
    int val;
    ListNode next;
    ListNode(int x){
        val = x;
        next = null;
    }
}