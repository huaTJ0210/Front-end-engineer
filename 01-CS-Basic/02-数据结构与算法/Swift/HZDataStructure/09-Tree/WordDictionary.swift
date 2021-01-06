//
//  WordDictionary.swift
//  HZDataStructure
//
//  Created by 华天杰 on 2021/1/4.
//

import Cocoa

class WordDictionary {
    
    class Node{
        var next:[Character:Node]!
        var isWord: Bool!
        init() {
            self.next = [Character:Node]()
            self.isWord = false
        }
    }
    
    var root:Node!
    /** Initialize your data structure here. */
    init() {
        self.root = Node()
      }
      
      /** Adds a word into the data structure. */
      func addWord(_ word: String) {
           var cur = root!
            for char in word {
                if cur.next[char] == nil {
                    cur.next[char] = Node()
                }
                cur = cur.next[char]!
            }
         cur.isWord = true
      }
      
      /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
      func search(_ word: String) -> Bool {
         return  search(node: root, word: word, index: 0)
      }
    private func search(node:Node,word:String,index:Int)->Bool{
        if index == word.count {
            return node.isWord
        }
        let c = Character(word[index])
        if c != "." {
            if node.next[c] == nil {
                return false
            }
            return search(node: node.next[c]!, word: word, index: index + 1)
        }else{
            for char in node.next.keys {
                if search(node: node.next[char]!, word: word, index: index + 1) {
                    return true
                }
            }
            return false
        }
    }
}
