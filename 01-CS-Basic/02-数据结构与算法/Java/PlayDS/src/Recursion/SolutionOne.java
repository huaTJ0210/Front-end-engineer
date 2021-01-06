package Recursion;

public class SolutionOne {
    class LinkNode {
        int value;
        LinkNode next;
        LinkNode(LinkNode next,int value){
            this.value = value;
            this.next = next;
        }
    }
    /*
    *  删除链表中给定的元素结点（有多个则都删除）
    *  1->2->3->6->4->5->6
    * */
    // （1）使用虚拟头结点解决
    public LinkNode deleteNode(LinkNode head,int value){
        LinkNode dummyHead =  new LinkNode(null,0);
        dummyHead.next = head;
        while (dummyHead.next != null){
            if (dummyHead.next.value == value){
                dummyHead.next = dummyHead.next.next;
            }
        }
        return  dummyHead.next;
    }
    // （2）使用递归的方式解决
    public LinkNode deleteNodeEle(LinkNode head,int value){
        if (head == null) return null;
        /*
        LinkNode res = deleteNodeEle(head.next,value);
        if (head.value == value){
            return res;
        }else{
            head.next = res;
            return head;
        }
        */
        head.next = deleteNodeEle(head.next,value);
        return  head.value == value ? head.next : head;
    }
}
