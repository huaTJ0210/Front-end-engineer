import Foundation

public class HZGenericity{
    public static func test(){
        
    }
    
    // 如何定义泛型函数
    func firstIndex<T:Equatable>(of valueToFind: T , in array: [T]) -> Int? {
        for (index,value) in array.enumerated(){
            if value == valueToFind {
                return index
            }
        }
        return nil
    }
}

// 关联类型 : 当定义协议时，不清楚实际遵守协议的类型是什么
protocol Container {
    associatedtype ItemType // 协议定义泛型
    mutating func append(_ item: ItemType)
    var count: Int {get}
    subscript(i:Int) -> ItemType{get}
}

// 泛型下标 : 通过传入的下标数组获取元素集合
extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [ItemType] where Indices.Iterator.Element == Int {
        var result = [ItemType]()
        for index in indices{
            result.append(self[index])
        }
        return result
    }
}

// 泛型编程思维： 泛型允许函数与类在不需要重写的情况下能接受多种不同的数据类型


