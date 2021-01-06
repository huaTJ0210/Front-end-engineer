import Foundation

/*
 【中介者】
   用中介者对象封装一系列的对象交互，
   中介者使各对象不需要显示地相互作用，从而耦合松散，而且可以独立改变他们之间的交互
 */

protocol Receiver {
    associatedtype MessageType
    func receive(message: MessageType)
}

protocol Sender {
    associatedtype MessageType
    associatedtype ReceiverType: Receiver
    
    var recipients: [ReceiverType] { get }
    
    func send(message: MessageType)
}
