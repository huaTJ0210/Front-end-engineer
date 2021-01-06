package Map;

public class LinkListMap<K,V> implements Map<K,V> {

    private class Node{
        public K key;
        public V value;
        public Node next;

        public Node(K key,V value,Node next){
            this.key = key;
            this.value = value;
            this.next = next;
        }

        public Node(K key){
            this(key,null,null);
        }
        public Node(){
            this(null,null,null);
        }

        @Override
        public String toString() {
            return key.toString() + ":" + value.toString();
        }
    }

    private Node dummyHeader;
    private int size;

    public LinkListMap(){
        this.size = 0;
        dummyHeader = new Node();
    }

    @Override
    public int getSize() {
        return size;
    }

    @Override
    public boolean isEmpty() {
        return this.size == 0;
    }

    // 根据key获取节点
    private Node getNode(K key){
        Node cur = dummyHeader.next;
        while (cur != null){
            if (cur.key.equals(key)){
                return  cur;
            }
            cur = cur.next;
        }
        return  null;
    }


    @Override
    public boolean contains(K key) {
        return getNode(key) != null;
    }


    @Override
    public V get(K key) {
        Node node = getNode(key);
        return node == null ? null : node.value;
    }


    @Override
    public void add(K key, V value) {
        Node node = getNode(key);
        if (node == null){
            // 在头节点位置插入
            dummyHeader.next = new Node(key,value,dummyHeader.next);
            size++;
        }else {
            node.value = value;
        }
    }

    @Override
    public void set(K key, V value) {
        Node node = getNode(key);
        if (node == null){
            // 在头节点位置插入
            throw  new IllegalArgumentException(key + "doesn't exist");
        }else {
            node.value = value;
        }
    }

    @Override
    public V remove(K key) {

        Node pre = dummyHeader;
        while (pre.next != null){
            if (pre.next.key.equals(key)){
                break;
            }
            pre = pre.next;
        }
        if (pre.next != null){
            Node delNode = pre.next;
            pre.next = delNode.next;
            delNode.next = null;
            size--;
            return  delNode.value;
        }
        return  null;
    }


}
