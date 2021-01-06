import Foundation
// 结构体的实例赋值给常量，属性则不能修改
struct Point {
    // 存储属性
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    // 计算属性
    var center:Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter){
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
    
}

// 属性观察者 willSet/didSet
class StepCount {
    var totalSteps: Int = 0 {
        willSet(newTotalStep){
            print("about to set totalStep:\(totalSteps)")
        }
        didSet{
            if totalSteps > oldValue {
                print("added\(totalSteps - oldValue) steps")
            }
        }
    }
}


// 属性前使用lazy：延迟属性 【多线程访问不能保证属性只初始化一次】

public  class HZProperty{
    // 类型属性
    static var sortedType = "someValue"
    // 使用class 允许子类重写
    class var anotherSorted: String {
        return ""
    }
    public static func test(){
        
    }
}
