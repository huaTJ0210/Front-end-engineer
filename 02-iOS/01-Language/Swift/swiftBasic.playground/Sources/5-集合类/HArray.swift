import Foundation

public class HArray{
    public static func test(){
        /*
           (1) 数组：使用有序列表存储同一类型的多个值；
         */
        /*******************1.1数组的创建***********************/
        // 1、字面量创建数组： 数组是否可变取决于（let还是var的声明）
        let array = [1,2,3,4]
        print(array)
        // 2、初始化器
        let array1 = Array<String>()
        print(array1)
        let fivezs = Array(repeating: "z", count: 5)
        print(fivezs)
        //3、初始化器传入参数
        let array2 = [Int](1...7)
        print(array2)
        let dict = ["zhang":8,"li":6,"liu":5]
        let names = [String](dict.keys)
        print(names)
        /*******************1.2数组的遍历和索引***********************/
        let numbers = [Int](1...7)
        for item in numbers {
            print(item)
        }
        // 不能使用break和continue
        numbers.forEach { (value) in
            print("forEach:\(value)")
        }
        for(index,value) in numbers.enumerated(){
            print("index:\(index),value:\(value)");
        }
        var iterator = numbers.makeIterator();
        while let num = iterator.next() {
            print("iterator:\(num)")
        }
        // 数组的索引 ： startIndex endIndex
        for i in numbers.indices {
            print("indices: index:\(i),value:\(numbers[i])")
        }
        /*******************1.3数组的查找***********************/
        let num1 = [10,20,30,40,50,60,70,80,90]
        print(num1.contains(10))
        print(num1.contains(where: {$0 < 30}))
        print(num1.allSatisfy({$0 > 30}))
        
        /*
           (1) first /firstIndex 、 last / lastIndex 获取数组中的值/索引，最终得到的值都是optional的
           (2)  min / max
         */
        
        /*******************1.4数组的添加和删除操作***********************/
        var num2 = [Int](2...7)
        num2.append(100)
        num2.append(contentsOf: 200...203)
        print(num2)
        
        num2.insert(-1, at: 1)
        num2.insert(contentsOf: -2...0, at: 0) //插入多个元素
        print(num2)
        
        num2.remove(at: 0)
        num2.removeFirst() // 遇到空数组报错：传入整数代表移除几个元素
     //   num2.dropFirst()
       print(num2.popLast() ?? 0)  // 使用 popLast 可以得到可选值;removeLast对于空数组会报错
        num2.removeSubrange(1...3)
        num2.removeAll()
        
        /*******************1.4数组的ArraySlice【获取一个子数组：在slice不修改的情况下与原数组共享内存】***********************/
        let num3 = [2,10,15,25,50,100,46,99]
        let slice = num3.dropFirst()
//        let array:[Int] = slice  不能直接将ArraySlice类型赋值给Array；需要使用Array() 转化
        print(slice)
        print(num3.prefix(3))
        print(num3.prefix(while: {$0 < 50}))
        print(num3.suffix(3))
//        print(num3.suffix(from: <#T##Int#>))
        // 通过区间运算符获取ArraySlice
        print(num3[1...3])
        
        /*******************1.5数组：重排操作***********************/
        var num4 = [Int](1...8)
        num4.shuffle() // 将原数组元素随机打乱【只能作用于变量】
        print(num4)
        let num5 = [Int](1...8)
        let num5New = num5.shuffled() // 返回数组的随机化数【常量和变量上均可】
        print(num5New)
        /*
          逆序： reverse/reversed()
         */
        /*
           数组的分组
         */
        var num6 = [10,20,30,50,80]
        let index = num6.partition { (ele) -> Bool in
            ele < 30
        }
        print(num6)
        print(num6[..<index])
        print(num6[index...])
        
        /*
          数组的排序 ： sorted/sort
         */
        var num8 = [10,20,30,40,50]
        num8.sort()
        let num8New = num8.sorted()
        print(num8New)
        /*
          数组的交换 : swapAt
         */
         var num7 = [10,20,30,40,50]
        num7.swapAt(num7.startIndex, num7.endIndex - 1)
        print(num7)
        /*******************1.6数组：拼接***********************/
        let num10 = ["hello","word"]
        print(num10.joined())
        print(num10.joined(separator: ","))
        /*******************1.7 深入了解数组探究数组的底层实现***********************/
        // 阅读Array实现的源码
        /*******************1.8 数组实现栈和队列***********************/
    }
}

// 定义一个栈的结构体
struct Stack<T> {
    private var elements = [T]()
    var count: Int {
        return elements.count
    }
    var isEmpty:Bool {
        return elements.isEmpty
    }
    var peek: T?{
        return elements.last
    }
    mutating func push(_ element: T){
        elements.append(element)
    }
    mutating func pop() -> T?{
        return elements.popLast()
    }
}
// 定义一个队列的结构体
struct Queue<T> {
    private var elements = [T]()
    var count: Int{
        return elements.count
    }
    var isEmpty: Bool {
        return elements.isEmpty
    }
    var peek: T?{
        return elements.first
    }
    mutating func enqueue(_ element:T){
        elements.append(element)
    }
    mutating func dequeue() -> T? {
        /*
        guard count > 0 else {
            return nil
        }
        return elements.removeFirst()
       */
        return isEmpty ? nil : elements.removeFirst()
    }
}
