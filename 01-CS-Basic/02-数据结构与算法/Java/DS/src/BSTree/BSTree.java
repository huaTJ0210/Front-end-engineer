package BSTree;

import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

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
        return this.size;
    }
    public boolean isEmpty(){
        return this.size == 0 ;
    }

    /*****************************二分搜索树中添加元素**************************************/

    //二分搜索树中添加元素
    public void add(E e){
        if (root==null){
            root = new Node(e);
            size++;
        }else{
            add(root,e);
        }
    }
    // 向以node为根的二分搜索树上插入元素
    private void add(Node node ,E e){
        if (e.equals(node.e)){
            return;
        }else if(e.compareTo(node.e) < 0 && node.left == null){
            node.left = new Node(e);
            size++;
            return;
        }else if(e.compareTo(node.e) > 0 && node.right == null){
            node.right = new Node(e);
            size++;
            return;
        }
        if (e.compareTo(node.e) < 0){
            add(node.left,e);
        }else{
            add(node.right,e);
        }
    }

    // 向二分搜索树中插入元素【如果待插入节点为空，则创建元素，并且将该元素返回】
    public void add1(E e){
        root = add1(root,e);
    }
    // 向以node为根的二分搜索树上插入元素
    private Node add1(Node node,E e){
        if (node == null){
            size ++;
            return  new Node(e);
        }else if(e.compareTo(node.e)<0){
            node.left = add1(node.left,e);
        }else if(e.compareTo(node.e)>0){
            node.right = add1(node.right,e);
        }
        return  node;
    }
    /*****************************二分搜索树中查询元素**************************************/

    public boolean contains(E e){
        return contains(root,e);
    }
    // 查找以node为根结点的二分搜索树
    private boolean contains(Node node,E e){
        if (node == null){
            return false;
        }

        if(e.compareTo(node.e) == 0 ){
            return true;
        }else if(e.compareTo(node.e) < 0 ){
            return contains(node.left,e);
        }else{
            return contains(node.right,e);
        }
    }

    /*****************************二分搜索树的遍历**************************************/

    // （1）前序遍历
    public void preOrder(){
        preOrder(root);
    }
    // 前序遍历以node为根结点的二分搜索树
    private void preOrder(Node node){
        if (node == null){
            return;
        }
        System.out.println(node.e); // 打印该节点
        preOrder(node.left); // 前序遍历左子树
        preOrder(node.right);// 前序遍历右子树
    }

    // (1-1) 非递归方式前序遍历二分搜索树
    public void preOrderNR(){
        if (root == null) return;
        Stack stack = new Stack();
        stack.push(root);
        while (!stack.isEmpty()){
            Node cur = (Node) stack.pop();
            System.out.println(cur.e); // 打印该节点
            if (cur.right != null) {
                stack.push(cur.right);
            }
            if (cur.left != null){
                stack.push(cur.left);
            }
        }
    }

    // (1-2) 二分搜索树的层序遍历（广度优先遍历）
    public void levelOrder(){
        Queue<Node> q = new LinkedList<>();
        q.add(root);
        while (!q.isEmpty()){
            Node cur = q.remove();
            System.out.println(cur.e); // 打印该节点
            if (cur.left != null){
                q.add(cur.left);
            }
            if (cur.right != null){
                q.add(cur.right);
            }
        }
    }


    // （2）中序遍历
    public void inOrder(){
        inOrder(root);
    }
    // 中序遍历以node为根结点的二分搜索树
    private void inOrder(Node node){
        if (node == null){
            return;
        }

        inOrder(node.left);// 中序遍历左子树
        System.out.println(node.e); //打印该节点
        inOrder(node.right);// 中序遍历右子树
    }

    /********************* 寻找二分搜索树的最小、大元素并完成删除操作*************/

    public E minimun(){
        if (size == 0){
            throw new IllegalArgumentException("BST is empty");
        }
        return minimum(root).e;
    }
    private Node minimum(Node node){
        if (node.left == null){
            return node;
        }
        return minimum(node.left);
    }


    // 删除掉以node为根的二分搜索树中的最小节点
    // 返回删除节点后新的二分搜索树的根

    public E removeMinmum(){
        E ret = minimun();
        root = removeMinmum(root);
        return ret;
    }

    private Node removeMinmum(Node node){
        // 注意根也是最小的结点（二分搜索树只存在右子树的情况，要删除根）
        if(node.left == null){
            Node rightNode = node.right;
            node.right = null;
            size -- ;
            return rightNode;
        }
        node.left = removeMinmum(node.left);
        return node;
    }

    // 获取二分搜索树中最大元素
    public E maximum(){
        return maximum(root).e;
    }

    private Node maximum(Node node){
        if (node.right == null){
            return node;
        }
        return maximum(node.right);
    }

    public E removeMaximum(){
        E ret = maximum();
        root = removeMaximum(root);
        return  ret;
    }

    public Node removeMaximum(Node node){
        if (node.right == null){
            Node leftNode = node.left;
            node.left = null;
            size--;
            return  leftNode;
        }
        node.right = removeMaximum(node.right);
        return  node;
    }

    //从二分搜索树上删除元素为e的节点
    public void remove(E e){
        root = remove(root,e);
    }
    /*
     *  删除以node为根的二分搜索树中值为e的节点，递归算法
     *  返回删除结点后新的二分搜索树的根
     * */
    private Node remove(Node node,E e){
        if (root == null){
            return null;
        }
        if (e.compareTo(node.e) < 0){
            node.left = remove(node.left,e);
            return  node;
        }else if(e.compareTo(node.e) > 0){
            node.right = remove(node.right,e);
            return  node;
        }else{ // e == node.e
            // 待删除节点左子树为空
            if(node.left == null){
                Node rightNode = node.right;
                node.right = null;
                size --;
                return rightNode;
            }else if (node.right == null){// 待删除节点右子树为空
                Node leftNode = node.left;
                node.left = null;
                size--;
                return leftNode;
            }else{
                // 待删除结点左右子树均不为空的情况
                // 找到比待删除结点大的最小节点，即待删除节点右子树的最小结点
                // 用这个节点顶替待删除节点的位置
                Node successor = minimum(node.right);
                successor.right = removeMinmum(node.right);
                successor.left = node.left;

                node.left = node.right = null;

                return successor;
            }
        }


    }



    public static void main(String args[]){
        BSTree<Integer> bst = new BSTree<Integer>();
        int[] nums = {5,3,6,8,4,2};
        for(int num:nums){
            bst.add1(num);
        }
        // bst.preOrder();
        System.out.println(bst);
    }

    @Override
    public String toString() {
        StringBuilder res = new StringBuilder();
        generateBSTString(root,0,res);
        return res.toString();
    }

    private void generateBSTString(Node node, int depth, StringBuilder res){
        if (node == null){
            res.append(generateDepthString(depth) + "null\n");
            return;
        }
        res.append(generateDepthString(depth) + node.e + "\n");
        generateBSTString(node.left,depth+1,res);
        generateBSTString(node.right,depth+1,res);
    }

    private String generateDepthString(int depth){
        StringBuilder res = new StringBuilder();
        for (int i = 0; i < depth; i++) {
            res.append("--");
        }
        return res.toString();
    }
}

