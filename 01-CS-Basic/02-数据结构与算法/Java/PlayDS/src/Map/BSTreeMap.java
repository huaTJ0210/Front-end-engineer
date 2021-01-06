package Map;

import java.util.IllformedLocaleException;

public class BSTreeMap<K extends Comparable<K>,V> implements Map<K,V> {

    private class Node{
        public K key;
        public V value;
        public Node left,right;

        public Node(K key,V value){
            this.key = key;
            this.value = value;
            this.left = null;
            this.right = null;
        }
    }

    private Node root;
    private int  size;

    public BSTreeMap(){
        this.root = null;
        size = 0;
    }

    @Override
    public int getSize() {
        return size;
    }

    @Override
    public boolean isEmpty() {
        return size == 0;
    }

    private Node getNode(K key){
        return getNode(key,root);
    }

    private Node getNode(K key , Node node){
        if (node == null){
            return null;
        }else{
            if(node.key.compareTo(key) == 0){
                return node;
            } else if (node.key.compareTo(key) < 0){
                return getNode(key,node.left);
            }else{
                return getNode(key,node.right);
            }
        }
    }

    @Override
    public boolean contains(K k) {
        return getNode(k) != null;
    }

    @Override
    public void set(K key, V value) {
        Node node = getNode(key);
        if (node == null){
            throw new IllformedLocaleException(key +"doesn't exists");
        }
        node.value = value;
    }

    @Override
    public V get(K key) {
        Node node = getNode(key);
        return node == null ? null : node.value;
    }

    @Override
    public void add(K key, V value) {
        root = add(root,key,value);
    }

    private Node add(Node node,K key,V value){
        if (node == null){
            size++;
            return new Node(key,value);
        }else{
            if (node.key.compareTo(key) < 0){
                node.left = add(node.left,key,value);
            }else if (node.key.compareTo(key) > 0){
                node.right = add(node.right,key,value);
            }else{
                node.value = value;
            }
            return node;
        }
    }

    @Override
    public V remove(K key) {
        Node node = getNode(key,root);
        if (node != null){
            root = remove(key,root);
            return node.value;
        }else{
            return null;
        }
    }
    private Node remove(K key,Node node){
        if (node == null) return null;
        if (node.key.compareTo(key) < 0){
            node.left = remove(key,node.left);
            return  node;
        }else if(node.key.compareTo(key) > 0){
            node.right = remove(key,node.right);
            return node;
        }else{
            if (node.left == null){
                Node rightNode = node.right;
                node.right = null;
                size--;
                return  rightNode;
            }else if (node.right == null){
                Node leftNode = node.left;
                node.left = null;
                size--;
                return leftNode;
            }else{
                // 左右都有孩子节点 找到 当前结点右孩子的后继中最小的结点
                Node curNode = minimum(node.right);
                curNode.right = removeMinumum(node.right);
                curNode.left = node.left;
                node.left= node.right = null;
                return  curNode;
            }

        }
    }

    private Node minimum(Node node){
        if (node == null) return null;
        while (node.left != null){
            node = node.left;
        }
        return node;
    }

    private Node removeMinumum(Node node){
        if (node == null) return null;
        if (node.left == null){                  
            Node rightNode = node.right;
            node.right = null;
            size--;
            return  rightNode;
        }
        node.left = removeMinumum(node.left);
        return node;
    }


}
