import Foundation

/*
 （1）
   继承、封装、多态
  对象之间的消息传递
 */
/*
   （2）类和结构体
  相同点：
  定义属性、方法、构造器、使用扩展、遵守协议
  不同点：
  类是引用类型，而结构体是值类型
  类可以继承，结构体不可以
 类实例可以被多次引用计数，结构体不可以
 */
public class HZClass{
    public static func test(){
        
    }
}

class MyClass {
    /*
      两段式初始化：
     （1）保证每一个存储属性都被分配一个初始化值
     （2）每个类都有机会在新实例使用前定制它的存储属性
      初始化器的安全检查：
     （1）子类初始化器中要先对子类的存储属性进行赋值；
        然后通过super调用父类的初始化器；然后再修改继承父类的存储属性
      （2）在未调用super.init初始化器之前 “self”不允许被使用
     （3）便利构造器必须调用同类的指定初始化器
     （4）重写父类的初始化器，则便利构造器也一并继承
     */
    deinit {
        
    }
}

class Vehicle {
    var currentSpeed: Int = 0
    // 使用final可以阻止该属性被重写
    var desc: String {
        return "run at speed \(currentSpeed)"
    }
    func makeNoise(){
        
    }
    
    // 多态： 数组存储多个子类时，类型推断为基类类型
    // 类型检查 ： is
    // 向下类型转化 : as? 或者  as!
    /*
      AnyObject : 可以表示任何类类型的实例
      Any : 可以表示任何类型，包括函数类型 
     */
}

class Car: Vehicle {
    var gear: Int = 0
    // 子类重写父类的属性
    override var desc: String{
        return super.desc + "at gear \(gear)"
    }
}

/*
   (1) 面向对象编程 -- OOP
   1、对于系统的整体分类设计能力要求较高，系统前期设计要抽象出类及相互之间的通讯；
  2、形成固定结构后，对于重构带来较大的风险性，如果仅仅重构单一方法是比较理想的行为，但是若要整体重构则带来很大风险
  3、不支持多继承，子类会产生臃肿的继承（不必要的继承）
  4、对象的状态传递比较难以跟踪 （值类型优于引用类型）
  （2）面向协议编程 -- POP -- ： 一个协议定义一系列的方法属性，协议可以被类、结构、枚举所遵守
 
 */

/****************************面向对象编程********************************/
/*
class Humen {
    var name: String
    var age: Int
    
    init(name: String,age: Int) {
        self.name = name
        self.age = age
    }
    
    func sayHi(){
        print("say hi")
    }
}

class Athlete: Humen {
    override func sayHi() {
        print("Hi,I'm \(name)")
    }
}

class Runner: Athlete {
    func run() {
        print("run")
    }
}

class Swimmer: Athlete {
    func swim() {
        print("swim")
    }
}
// ?? 如果既是田径运动员 又是游泳运动员
 */

protocol Human {
    var name: String{get set}
    var age: Int{get set}
    func sayHi()
}

protocol Runnable {
    func run()
}

protocol Swiming {
    func swim()
}

struct Runner:Human,Runnable {
    var name: String = "zhang"
    var age: Int = 18
    func sayHi() {
        print("i'm \(name)")
    }
    func run() {
        print("run!!")
    }
}
