import Foundation

/*
   判断ATM机中的金额是否够取？
 */

protocol Withdrawings {
    func withdraw(amount:Int) -> Bool
}

// 抽象化的钱堆
class MoneyPiles:Withdrawings {
    let value: Int
    var quantity: Int
    var next:Withdrawings?
    
    init(value:Int, quantity:Int,next:Withdrawings?) {
        self.value = value
        self.quantity = quantity
        self.next = next
    }
    
    func withdraw(amount:Int) -> Bool {
        func canTakeBill(want:Int) -> Bool{
            return (want / self.value) > 0
        }
        var leaveAmount = amount
        while canTakeBill(want: amount) {
            if quantity == 0 {
                break
            }
            leaveAmount  -= value
            quantity -= 1
        }
        guard leaveAmount > 0 else{
            return true
        }
        if let next = self.next {
          return  next.withdraw(amount: leaveAmount)
        }
        return false
    }
}

class ATMS: Withdrawings{
    
    private var ten:Withdrawings
    private var twenty:Withdrawings
    private var fifty:Withdrawings
    private var hundred:Withdrawings
    
    private var startPile:Withdrawings{
        return self.hundred
    }
    
    // 存入初始化行为
    init(ten:Withdrawings,twenty:Withdrawings,fifty:Withdrawings,hundred:Withdrawings) {
        self.ten = ten
        self.twenty = twenty
        self.fifty = fifty
        self.hundred = hundred
    }
    
    // 取款的行为
    func withdraw(amount: Int) -> Bool {
        return startPile.withdraw(amount: amount)
    }
}
