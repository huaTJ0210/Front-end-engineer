import Foundation

class HZProtocol {
    
}

protocol FullyNamed {
    var fullName: String {get}
}

struct Person1: FullyNamed {
    // 提供存储属性可以满足可读可写
    var fullName: String
}

// 协议可以继承
// 类专用类型： AnyObject限制
// 协议组合 使用 someProtocol & anotherProtocol 连接
// 可选要求 optional

protocol TextRepresentable {
    var desc: String {get}
}

extension Person1: TextRepresentable{
    var desc: String{
        return "name --- age "
    }
}

extension Array: TextRepresentable where Element: TextRepresentable{
    var desc: String{
        let itemDesc = self.map{$0.desc}
        return itemDesc.joined(separator:  ",")
    }
}

