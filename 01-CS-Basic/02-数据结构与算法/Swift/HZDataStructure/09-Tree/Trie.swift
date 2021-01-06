//
//  Trie.swift
//  HZDataStructure
//
//  Created by 华天杰 on 2021/1/4.
//

import Cocoa

/*
  实现前缀树：
 
 */
class Trie: NSObject {
    
    class Node{
        var isWord: Bool!
        var next: [Character:Node]!
//        // 指定构造器
//        init(isWord:Bool) {
//            self.isWord = isWord
//            self.next = [Character:Node]()
//        }
        // 遍历构造器
         init(){
            self.isWord = false
            self.next = [Character:Node]()
        }
    }
    
    private var root:Node!
    private var size:Int!
    
    override init() {
        self.root =  Node()
        self.size = 0
    }
    
    // 向Tire中添加单词
    public func insert(_ word:String){
        var cur = root!
        for char in word {
            if cur.next[char] == nil {
                cur.next[char] = Node()
            }
            cur = cur.next[char]!
        }
        if !cur.isWord {
            cur.isWord = true
            self.size += 1
        }
    }
    // 在Tire中查询是否存在指定的word
    public func search(_ word:String) -> Bool{
        var cur = root!
        for char in word {
            if cur.next[char] == nil {
                return false
            }
            cur = cur.next[char]!
        }
        return cur.isWord
    }
    // 在Tire中搜索以prefix为开头的单词是否存在
    public func startsWith(_ prefix:String) ->Bool{
        var cur = root!
        for char in prefix {
            if cur.next[char] == nil {
                return false
            }
            cur = cur.next[char]!
        }
        return true
    }
    
}

