import Foundation

public class HZOperation{
    public static func test(){
        /*
           (1) Operation的状态
            isReady
            isExecuing
            isFinished
            isCancelled
         */
        ObjectForOperation().myOperation()
    }
}

class ObjectForOperation {
    func myOperation() {
        let operation = MyOperation()
        operation.completionBlock = { ()->Void in
            print("completionBlock")
        }
        let queue = OperationQueue()
        queue.addOperation(operation)
        print("myOperation start!!")
        
        // blockOperation
        let blockOp = BlockOperation {
            sleep(4)
            print("blockOp")
        }
        queue.addOperation(blockOp)
    }
}

class MyOperation: Operation {
    override func main() {
        sleep(2)
        print("myOperation!!!")
    }
}
