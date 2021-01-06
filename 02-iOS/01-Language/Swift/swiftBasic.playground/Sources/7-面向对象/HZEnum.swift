import Foundation

/*
   (1) 枚举：枚举为一组相关的值定义了共同的类型
 */
enum CompassPoint: CaseIterable { // 当枚举遵循CaseIterable协议，Swift会生成一个allCases属性，用于包含所有枚举成员
    case north
    case south
    case east
    case west
}
enum BarCode{ // 枚举的关联值定义
    case upc(Int ,Int ,Int,Int)
    case qrCode(String)
}
// 递归枚举： 是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

public class HZEnum {
  
    public static func test(){
        // (1) 使用枚举
        var direction = CompassPoint.north
        print(direction)
        direction = .south
        /*
        switch direction {
        case .east:
            print("east")
        case .west:
            print("west")
        case .north:
            print("north")
        case .south:
            print("south")
        }
       */
        // (2) 枚举成员的可遍历
        for item in CompassPoint.allCases{
            print(item)
        }
        // (3) 枚举递归 ： （ 5 + 4 ） * 2
        let five = ArithmeticExpression.number(5)
        let four = ArithmeticExpression.number(4)
        let sum = ArithmeticExpression.addition(five, four)
        let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
        
        func evaluate(_ expression: ArithmeticExpression) -> Int {
            // let 的作用是绑定赋值
            switch expression {
            case let .number(value):
                return value
            case let .addition(left, right):
                return evaluate(left) + evaluate(right)
            case let .multiplication(left, right):
                return evaluate(left) * evaluate(right)
            }
        }

        print(evaluate(product))
        // 打印“18”
        print(HZEnum.sum(array: [1,2,3,4]))
    }
    
    
    // **** 使用递归来计算数组元素的值和
   static func sum(array:[Int]) -> Int{
        return sum(left: 0, array: array)
    }
    
  // sum(Array[n-1 ... 0]) =
    static func sum(left: Int , array:[Int]) -> Int {
        if left == array.count {
            return 0
        }
        return array[left] + sum(left: left + 1 , array: array)
    }
}
