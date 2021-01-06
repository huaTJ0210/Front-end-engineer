package Set;

public class LinkList<E> {


    private class Node{
        public E e;
        public Node next;
        public Node(){
            this.next = null;
        }
        public Node(E e){
            this.next = null;
            this.e = e;
        }
    }

    private Node dummyHeader;
    private int size;

    public LinkList(){
        this.size = 0;
        this.dummyHeader = new Node();
    }

    public int getSize(){
        return  this.size;
    }

    public boolean isEmpty(){
        return this.size == 0;
    }

    // (1)向链表中添加元素
    public void add(E e,int index){
        if (index < 0 || index > this.size){
            throw new  IllegalArgumentException("error index");
        }

        Node cur = dummyHeader;
        for (int i = 0; i < index; i++) {
            cur = cur.next;
        }
        Node newNode = new Node(e);
        newNode.next = cur.next;
        cur.next = newNode;
        size++;
    }

    public void addFirst(E e){
        add(e,0);
    }

    public void addLast(E e){
        add(e,this.size);
    }

    // (2) 判断链表中是否包含某个元素
    public boolean contains(E e){
        Node cur = dummyHeader;
        for (int i = 0; i < this.size; i++) {
            cur = cur.next;
            if (cur.e.equals(e)){
                return true;
            }
        }
        return false;
    }
    // (3) 从链表中删除某个节点
    public void remove(E e){
        Node cur = dummyHeader;
        for (int i = 0; i < this.size; i++) {
            if (cur.next.e.equals(e)){
                break;
            }
            cur = cur.next;
        }
        if (cur.next != null){
            Node delNode = cur.next;
            cur.next = delNode.next;
            delNode.next = null;
        }
    }

}
