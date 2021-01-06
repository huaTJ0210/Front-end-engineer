import Foundation

public class HZFunction{
    public static func test(){
        /*
         (1) 函数是完成特定任务的独立代码片段
         */
        
        /*
         (2) 闭包是自包含的函数代码块，可以在代码中被传递和使用，同时闭包可以捕获其所在上下文中任意的常量和变量
         */
        var nums: [Int] = [2,5,3,7,1,9]
        nums.sort{ (s1, s2) -> Bool in
            return s1 > s2
        }
        print(nums)
        
        // 1、闭包捕获值
        // 2、闭包逃逸及自动闭包
        // 3、高阶函数(map/reduce/filter/flatMap/compatMap )
        
        // 函数式编程（1）
        let source = "Hello world"
       let target: [Character] = ["a","e","i","o","u"]
       zip(0..<source.count, source).forEach { (index, char) in
           if target.contains(char) {
               print(index)
           }
       }
        // 函数式编程（2）
        let employee = ["neal","s","stu","j","rich","bob","aiden"]
        let cleanedNames = employee.filter(){$0.count > 1}
            .map(){$0.capitalized}
            .joined(separator: ",")
        print(cleanedNames)
        
    }
    
    // 范式转换 - 函数式
    let NON_WORDS:Set<String> = ["the","is"]
    func wordFreq(words: String) -> [String: Int] {
        var wordDict: [String: Int] = [:]
        let wordList = words.split(separator: " ")
        wordList.map{$0.lowercased()}
            .filter{!NON_WORDS.contains($0)}
            .forEach { (word) in
            wordDict[word] = (wordDict[word] ?? 0) + 1
        }
        return wordDict
    }
}
