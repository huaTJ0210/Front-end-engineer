//
//  main.swift
//  HZDataStructure
//
//  Created by 华天杰 on 2020/12/28.
//

import Foundation



// Test - Trie
testTrie()
func testTrie()  {
    let trie = Trie()
    trie.insert("apple");
   print(trie.search("apple"));   // 返回 true
   print(trie.search("app"));     // 返回 false
   print(trie.startsWith("app")); // 返回 true
   trie.insert("app");
   print(trie.search("app"));     // 返回 true
}
