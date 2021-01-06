import Foundation

/*
   【责任链模式】
     1、它包含了一些命令对象和一系列的处理对象；
     2、每个处理对象决定它能处理哪些命令对象，
     3、每个处理对象也需要将不能处理的命令对象传递给该链的下一个处理对象
 
      A --> B --> C --> D
 
     场景：
      ATM取钱的业务： 取出的金额面值10，20，50，100
   （1）MoneyPile ： 钱堆【10，20，50，100】
   （2）ATM：取钱
   
 */
protocol Withdrawing {
    func withdraw(amount: Int) -> Bool
}

final class MoneyPile:Withdrawing{
    let value: Int // 面值
    var quantity: Int // 数量
    var next: Withdrawing? // 下一个处理对象
    
    init(value: Int, quantity: Int, next: Withdrawing?) {
        self.value = value
        self.quantity = quantity
        self.next = next
    }
    
    func withdraw(amount: Int) -> Bool {
        var amount = amount
        func canTakeSomeBill(want:Int) -> Bool{
            return  (want / self.value) > 0
        }
        var quantity = self.quantity
        while canTakeSomeBill(want: amount) {
            if quantity == 0 {
                break
            }
            amount -= self.value
             quantity -= 1
        }
        guard amount > 0 else {
            return true // 表示ATM机中的钱足够取款的金额
        }
        if let next = self.next {
            return next.withdraw(amount: amount)
        }
        return false
    }
}

class ATM:Withdrawing{
    private var hundred: Withdrawing
    private var fifty: Withdrawing
    private var twenty: Withdrawing
    private var ten: Withdrawing
    
    private var startPile: Withdrawing{
        return self.hundred
    }
    
    init(hundred: Withdrawing,fifty: Withdrawing,twenty:Withdrawing,ten:Withdrawing) {
        self.hundred = hundred
        self.twenty = twenty
        self.fifty = fifty
        self.ten = ten
    }
    
    func withdraw(amount: Int) -> Bool {
        return startPile.withdraw(amount: amount)
    }
}

public class ChainOfResponsebilityTest{
    public static func test(){
        // 创建一系列的钱堆，并将其链接起来：10<20<50<100
        let ten = MoneyPile(value: 10, quantity: 6, next: nil)
        let twenty = MoneyPile(value: 20, quantity: 2, next: ten)
        let fifty = MoneyPile(value: 50, quantity: 2, next: twenty)
        let hundred = MoneyPile(value: 100, quantity: 1, next: fifty)

        // 创建 ATM 实例
        let atm = ATM(hundred: hundred, fifty: fifty, twenty: twenty, ten: ten)
        let res1 =  atm.withdraw(amount: 310) // Cannot because ATM has only 300
        print(res1)
        let res2 = atm.withdraw(amount: 100) // Can withdraw - 1x100
        print(res2)
    }
}
