import Foundation

/*
   对于生命周期中引用会变为nil的实例，使用弱引用（只能声明为变量，且是可选）
  对于初始化时赋值之后引用再也不会赋值为nil的实例使用无主引用（unowned）
 */


class Person2 {
    var name:String
    init(name: String) {
        self.name = name
    }
    var department: Department?
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Department {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: Person2?
    deinit {
        print("Apartment\(unit) is being deinitialized")
    }
}

class Country{
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country // 使用无主引用打破引用循环
    init(name: String,country: Country) {
        self.name = name
        self.country = country
    }
}

/*
   闭包使用过程汇总循环引用的解决方案
   定义占有列表-占有列表的每一元素都是weak或者unowned关键字和实例的引用（self或者someInstance）组成
           lazy var someClosure = {
            [unowned self, weak delegate = self.delegate]
            (index: Int, stringToProcess: String) -> String in
         }
 */
