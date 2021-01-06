package Set;


public class BSTree<E extends Comparable<E>> {

    private class Node{
       public E e;
       public Node left , right;
       public Node(E e){
            this.e = e;
            this.left = null;
            this.right = null;
        }
    }

    private Node root;
    private int size;
    public BSTree(){
        this.root = null;
        this.size = 0;
    }

    public int size(){
        return  this.size;
    }
    public boolean isEmpty(){
        return  this.size == 0;
    }

    // (1)向二分搜索树中添加元素
    public void add(E e){
        root = add(root,e);
    }
    private Node add(Node node,E e){
        if (node == null){
            size ++;
            return new Node(e);
        }else if (e.compareTo(node.e) < 0){
            node.left = add(node.left,e);
        }else if (e.compareTo(node.e) > 0){
            node.right = add(node.right,e);
        }
        return node;
    }

    // (2)查找二分搜索树中是否存在某一元素
    public boolean constains(E e){
        return constains(root,e);
    }
    private boolean constains(Node node , E e){
        if (node == null){
            return false;
        }else if (e.compareTo(node.e) == 0){
            return true;
        }else if(e.compareTo(node.e) < 0){
            return constains(node.left,e);
        }else {
            return constains(node.right,e);
        }
    }

    // (3) 查找二分搜索树中最小元素并删除
    public E minimum(){
        if (root == null){
            throw  new IllegalArgumentException("BSTree is Empty!!");
        }
        return minimum(root).e;
    }
    private Node minimum(Node node){
        if (node.left == null){
            return node;
        }
       return minimum(node.left);
    }

    public E removeMinimum(){
        E e = minimum();
        root = removeMinimum(root);
        return e;
    }
    public Node removeMinimum(Node node){
        if (node.left == null) {
            Node rightNode = node.right;
            node.right = null;
            size--;
            return rightNode;
        }else{
            node.left = removeMinimum(node.left);
            return node;
        }
    }
    // (4) 查找二分搜索树中最大元素并完成删除操作
    public E maximum(){
        if (root == null){
            throw new IllegalArgumentException("BSTree is empty");
        }
        return maximum(root).e;
    }
    private Node maximum(Node node){
        if (node.right == null){
            return node;
        }else{
            return maximum(node.right);
        }
    }
    public E removeMaximum(){
        E e = maximum();
        root = removeMaximum(root);
        return e;
    }
    private Node removeMaximum(Node node){
        if (node.right == null){
            Node leftNode = node.left;
            node.left = null;
            size--;
            return leftNode;
        }else{
            node.right = removeMaximum(node.right);
            return node;
        }
    }

    // (5) 删除二分搜索树中任意的元素
    public void remove(E e){
        if (root == null){
            return;
        }
        root = remove(root,e);
    }
    private Node remove(Node node,E e){

         if (e.compareTo(node.e) < 0){
             node.left = remove(node.left,e);
             return node;
         }else if (e.compareTo(node.e) > 0){
             node.right = remove(node.right,e);
             return node;
         }else{
             if (node.left == null){
                 Node rightNode = node.right;
                 node.right = null;
                 size --;
                 return rightNode;
             }else if (node.right == null){
                 Node leftNode = node.left;
                 node.left = null;
                 size--;
                 return  leftNode;
             }else {
                 // e == node.e
                 Node succeed = minimum(node.right);
                 succeed.right = removeMinimum(node.right);
                 succeed.left = node.left;
                 node.left = node.right = null;
                 return  succeed;
             }
         }
    }
}
