import Foundation

public class HZThread{
    public static func test(){
        for i in 0..<10 {
            Thread.detachNewThread {
                print(i)
            }
        }
        
       let threadTest = ThreadObject()
        threadTest.threadTest()
    }
}

class ThreadObject {
    func threadTest()  {
        let thread = Thread(target: self, selector: #selector(threadWork), object: nil)
        thread.start()
    }
    @objc func threadWork(){
        print("thread work")
    }
    
    /*
       【多线程使用场景】
       1： 一个页面的三个网络请求需要请求都返回时刷新页面：【 dispatchGroup【enter、leave】，dispathNotify】【operation的依赖】
       2： 实现一个线程安全的Array的读写【】
       3：编写一个多线程下载器。可以执行多个下载任务，每个任务可以保存当下下载的字节数，总字节数，可以设置回调得到当前下载的进度 【operation + operationQueue + 重写main方法】
       4：需要在主线程中等待一个异步任务返回，才能继续执行下面的逻辑，但是又不希望堵塞用户事件 【runloop】
     */
    /*
       【多线程编程模式】
      Promise ：【https://github.com/mxcl/PromiseKit】
     【https://www.hangge.com/blog/cache/detail_2231.html】
      promise对象代表一个异步操作，有三种状态：Pending（运行中）、resolved（已完成：fulfilled）、rejected（已失败）
       只有异步操作的结果才能改变这个状态，任何其他状态都无法改变状态
     Pipeline
     
     */
}
