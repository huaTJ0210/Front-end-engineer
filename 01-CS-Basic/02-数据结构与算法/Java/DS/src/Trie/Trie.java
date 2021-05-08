package Trie;

import java.util.TreeMap;

public class Trie {

    private class Node{

        public boolean isWord;
        public TreeMap<Character,Node> next;

        public Node(boolean isWord){
            this.isWord = isWord;
            next = new TreeMap<>();
        }

        public Node(){
            this(false);
        }
    }

    private Node root;
    private int size;

    public Trie(){
        root = new Node();
        size = 0;
    }

    // 获取Trie中存储的单词数量
    public int getSize(){
        return size;
    }

    // 向Trie中添加一个新的单词word
    public void insert(String word){
        Node cur = root;
        for (int i = 0; i < word.length() ; i++) {
            char c = word.charAt(i);
            if (cur.next.get(c) == null){
                cur.next.put(c,new Node());
            }
            cur = cur.next.get(c);
        }
        if (!cur.isWord){
           cur.isWord = true;
           size ++;
        }
    }

   // 查询单词word是否在Trie中
   public boolean search(String word){

        Node cur = root;
       for (int i = 0; i < word.length(); i++) {
           char c = word.charAt(i);
           if (cur.next.get(c) == null){
               return false;
           }
           cur = cur.next.get(c);
       }
       return  cur.isWord; // 避免遍历都结尾不是一个单词的情况
   }
   
   // 查询是否在Trie中有单词以prefix为前缀
    public boolean startsWith(String prefix){

        Node cur = root;
        for (int i = 0; i < prefix.length(); i++) {
            char c = prefix.charAt(i);
            if (cur.next.get(c) == null){
                return false;
            }
            cur = cur.next.get(c);
        }
        return true;
    }
}
