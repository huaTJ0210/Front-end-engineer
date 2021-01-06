import Foundation

public class PrimaryDataType {
  public static func test() -> Void {
        /*
           1、常量和变量的声明
         */
        let maxNumberOfLoginAttemp = 10
        var loginNumber = 0
        //maxNumberOfLoginAttemp = 12 常量定义后不允许修改,否则编译器报错
        loginNumber = 12
       print(maxNumberOfLoginAttemp)
       print(loginNumber)
      // 类型注解
      let welcomeMessage: String = "welcomeMessage"
      print(welcomeMessage)
    
    
    /*
       2、整数
       Swift 提供 8/32/64 位有符号和无符号整数
      对应大小（字节数）：除8
     */
     print("UInt8 min \(UInt8.min) max \(UInt8.max)")
    /*
       3、浮点类型
       Float ： 6位小数   占4个字节
       Double： 15位小数  占8个字节
     */
    
    /*
       4、布尔类型
          true和false
         Swift不允许使用非布尔类型替换条件判断时的布尔类型
         var i = 1
         if i == 0 {
             print(i)
     }
     */
    
    /*
       5、类型别名 :为已存在类型提供一个可供选择的名称
     Swift不允许使用非布尔类型替换条件判断时的布尔类型
     */
    typealias AudioSample = UInt8
    let sample: AudioSample = 32
    print(sample)
    
    /*
       6、元组 Tuple
      使用元组整合多个值 【函数返回多个值 】
     */
    let error = (errorCode:1,errorMessage:"没有权限")
    print(error.errorMessage)
    print(error.errorCode)
    
    /*
       7、可选类型(Optional)
      Swift提供可选类型：可选类型存在两种情况：要么有值 要么为nil
      1： nil在objective-c中代表指向一个不存在对象的指针
      2： nil在swift中代表可选类型的值缺失
     */
     let str: String? = "abc"
    // (1)判断
    if str != nil{
        let count = str!.count
        print(count)
    }
     // (2) 可选绑定
    if let actualStr = str{
        let count = actualStr.count
        print(count)
    }
    // (3) 强制展开:直接对可选类型定义的值使用！进行解包【尽量不要采用这种方法】
    print(str!.count)
    
    // (4) 隐式展开: 定义时已知道值存在
    let str1: String! = "qwer"
    print(str1.count)
    
    //(5) 可选链式调用【可选类型调用返回的仍然是可选类型  】
    let str2 :String? = "asdf"
    let count = str2?.count
    if count != nil {
        let lastIndex = count! - 1
        print(lastIndex)
    }
    // (6) Optional的实现原理
    let optionalStr:Optional<String> = "abc" // 同 let optionalStr: String? = "abc" 一样
    if optionalStr != nil {
        let count = optionalStr.unsafelyUnwrapped.count
        print(count)
    }
    
    /*
       8 、 字符串
     */
    // （1）使用索引访问和修改字符串
     var welcome = "hello"
    
    print("获取字符串指定位置的字符")
    let charIndex = welcome.index(welcome.startIndex, offsetBy: 1)
    
    print(welcome[charIndex])
    
    print(welcome[welcome.index(before: welcome.endIndex)])
    
    welcome.insert("!", at: welcome.endIndex)
    print(welcome)
    welcome.insert(contentsOf:" there", at: welcome.index(before: welcome.endIndex))
    print(welcome)
    welcome.remove(at: welcome.index(before: welcome.endIndex))
    print(welcome)
    let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
    welcome.removeSubrange(range)
    print(welcome)
    // (2)  获取子串和进行字符串的比较（Substring类型）
    
    let welcome1 = "hello,world"
    let index = welcome1.firstIndex(of: ",") ?? welcome1.endIndex
    let subString = welcome1[..<index]
    print(subString)
    let newString = String(subString)
    print(newString)
    // 字符串的比较
    print(welcome1.hasPrefix("hello"))
    print(welcome1.hasSuffix("world"))
    
    }
}
