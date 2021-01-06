import Foundation

public class ControlFlow {
    public static func test(){
        /*
          (1) 循环控制
         
        let dic = ["spider":8,"ant":4,"cat":2]
        for (name,legNum) in dic {
            print("\(name) has \(legNum)")
        }
        
        for i in stride(from: 0, through: 50, by: 5){
            print(i) // 按照某种步频进行打印
        }
        
        for i in stride(from: 0, to: 50, by: 5){
            print(i) // 按照某种步频进行打印【不包含右侧区间】
        }
        var count = 0
        repeat{
            print(count)
            count += 1
        }while count < 5
        */
        
        /*
          (2) 更强大的switch
         */
        
        /*
          (3) 流程控制转移
           break;continue;fallthrough
         */
        
        /*
          (4) 使用guard 如何改善条件判断
         尽早退出：将不符合业务逻辑的判断提前
         */
        
        /*
          (5) 模式和模式匹配
         */
        // 1、可选项模式
        let nums: [Int?] = [nil,1,2,nil,5]
        for case let x? in nums {
            print(x)
        }
        
        // 2、类型转换模式 （is as）
        
        // 3、 表达式模式
    
        
    }
    /*
    struct Teacher{
        var name:String
        var salary:Int
    }
    func ~= (pattern:Range<Int>,value:Teacher)->Bool{
        return pattern.contains(value.salary)
    }
 */
    
    func isIPAddress(ipAddr:String) -> (Int,String) {
        let components = ipAddr.split(separator: ".")
        guard components.count == 4 else {
            return (100,"ip只能有4部分")
        }
        guard let first = Int(components[0]),first >= 0 && first < 256 else {
            return (1,"第1个数不对")
        }
        guard let second = Int(components[0]),second >= 0 && second < 256 else {
            return (2,"第2个数不对")
        }
        guard let third = Int(components[0]),third >= 0 && third < 256 else {
            return (3,"第3个数不对")
        }
        guard let fourth = Int(components[0]),fourth >= 0 && fourth < 256 else {
            return (4,"第4个数不对")
        }
        return (0,"")
    }
}
