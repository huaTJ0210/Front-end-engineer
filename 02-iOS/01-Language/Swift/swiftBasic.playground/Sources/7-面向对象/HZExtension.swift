import Foundation
/*
   为现有的类、结构体、枚举、协议添加新功能
 */
public class HZExtension{
    public static func test(){
        
    }
}

extension Double {
    // 为Double添加一个计算属性
    var km: Double{
        return self / 1000.0
    }
}

extension Int {
    // 扩展方法
    func repeatTask(task:()->())  {
        for _  in 0..<self {
            task()
        }
    }
    // 根据下标获取制定位上的数字
    subscript(digitIndex: Int) -> Int{
        get{
            var base = 1
            for _ in 0..<digitIndex{
                base *= 10
            }
            return (self / base) % 10
        }
    }
}
