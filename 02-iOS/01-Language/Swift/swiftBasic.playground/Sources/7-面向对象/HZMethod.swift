import Foundation

public class HZMethod {
    // 类型方法：属性可以重写
    public class func subMethod(){
        
    }
    
    public static func test(){
        
    }
    
    var count = 0
    // 实例方法
    func increment(){
        // 隐藏了 -- self --
        count += 1
    }
    func increment(by amount: Int){
        count += amount
    }
    
    struct Point {
        var x = 0.0, y = 0.0
        // 在实例方法中修改属性： 结构体和枚举是值类型，默认情况下不能修改，可以选择在func前面添加 mutating关键字
        mutating func moveBy(x deltaX: Double, y deltaY:Double){
            x += deltaX
            y += deltaY
        }
    }
    // 一个三状态的开关
    enum TriStateSwitch{
        case off,low,high
        // 隐式设置self
        mutating func next(){
            switch self {
            case .off:
                self = .low
            case .low:
                self = .high
            case .high:
                self = .off
            }
        }
    }
    func light(){
        var ovenLight = TriStateSwitch.low
        ovenLight.next()
    }
    
    
    // 下标方法
    struct TimesTable {
        let multiplier: Int
        subscript(index: Int) -> Int{
            return multiplier * index
        }
    }
    func subscriptMethod(){
        let threeTimesTable = TimesTable(multiplier: 3)
        print(threeTimesTable[6])
    }
   // 定义多参数的下标方法
    struct Matrix {
        let rows: Int , columns: Int
        var grid: [Double]
        init(rows: Int, columns: Int ) {
            self.rows  = rows
            self.columns = columns
            grid = Array(repeating: 0.0, count: rows * columns)
        }
        func indexIsValid(row: Int, column: Int) -> Bool {
            return (row >= 0 &&  row < rows && column >= 0 && column < columns)
        }
        subscript(row: Int ,column: Int) -> Double{
            get{
                assert(indexIsValid(row: row, column: column),"index out of range")
                return grid[(row * columns) + column]
            }
            set{
                assert(indexIsValid(row: row, column: column),"index out of range")
                grid[(row * columns) + column] = newValue
            }
        }
    }
    // 类型下标 ：static subscript
    
    

}
