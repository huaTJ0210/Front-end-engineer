import Foundation

/*
   使用协议类型会更宽泛；
   不透明类型：指代某种特定类型
   在使用self或者associatedType时，需要使用不透明类型 （some type）
 */

protocol Container1 {
    associatedtype Item
    var count: Int {get}
}
