import Foundation

public class HZGCD{
    public static func test(){
        let queue = DispatchQueue(label: "my dispatchQueue", qos: DispatchQoS.default, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
        // 同步执行 ； async异步
        queue.sync {
            print("in queue sync")
        }
        // wallTime
        queue.asyncAfter(deadline: .now()) {
            sleep(2)
            print("after 2 seconds")
        }
        print("after invoke queue method")
        
        // dispatchGroup-wait
        let workingGroup = DispatchGroup()
        let workingQueue = DispatchQueue(label: "my workQueue")
        
        // task 1
        workingGroup.enter()
        workingQueue.async {
            sleep(2)
            print("task 1 sleep 2")
            workingGroup.leave()
        }
        
        // task 2
        workingGroup.enter()
        workingQueue.async {
            sleep(3)
            print("task 2 sleep 3")
            workingGroup.leave()
        }
        /*
        workingGroup.wait()  // 同步行为，具有阻塞的作用
        print("all task excute finished!! -- 可以合并两个接口的数据了")
      */
        workingGroup.notify(queue: .main) {
            print("all group task is finished！！")
        }
        print("执行其他任务")
        
        // dispatch Source ： 监视某些类型事件的对象，当这些事件发生时，它自动将一个task放入一个dispatch queue 的执行例程中
        var seconds = 10
        let timer: DispatchSourceTimer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
        timer.schedule(deadline: .now(), repeating: 1.0)
        timer.setEventHandler {
            seconds -= 1
            if seconds < 0 {
                timer.cancel()
            }else{
                print(seconds)
            }
        }
        timer.resume()
        
        /*
           GCD - sync 死锁问题
         */
        let syncQueue = DispatchQueue(label: "a sync queue")
        syncQueue.sync {
            print(Thread.current)
            print("sync task1 print")
//            syncQueue.sync {
//                print("sync tak2 print")
//            }
        }
        
        /*
            【死锁】： A线程对资源X进行访问并加锁，B线程对Y资源进行访问并加锁，当发生A线程要获取Y资源，B线程要获取X资源时；
            线程A,B都需要等待对方进行解锁操作；这样就会发生死锁
           【临界区】： 不能被多线程访问的区域；
           【竞态条件】： 读写共享资源有时序性
           【优先级反转】： 没有按照设置的优先级进行线程的执行
            【并发】： 时间片的轮转
            【并行】： 多核心CPU执行
         */
        
        /*
          （1） SpinLock ： 自旋锁
          线程通过busy-wait-loop的方式来获取锁，任意时刻只有一个线程能够获取锁，其他线程忙等待直到获得锁
          bool lock = false; // 一开始没有锁上，任何线程都可以申请锁
          do{
            while(test_and_set(&lock)); // test_and_set 是一个原子操作
            Critical section// 临界区
            lock = false; // 相当于释放锁，别的线程可以进入临界区
              reminder section // 不需要锁保护的代码
         }
         【使用注意事项】
          1 ： 临界区的代码不要过于复杂
          2： 线程的优先级设置为相同
         */
        
        /*
          （2） synchronized
            【注意事项】
            1、只有传同样的对象给synchronized，才能起到加锁的作用
            2、如果传nil，是无法起到加锁作用的
            3、可以重入 ： 同一个线程允许多次进入
            4、synchronized不会持有传给它的对象

         
         */
        func synchronized(_ obj: AnyObject,closure:()->()){
          objc_sync_enter(obj)
          closure()
          objc_sync_exit(obj)
        }
        
      /*
         int objc_sync_enter(id obj){
             int result = OBJC_SYNC_SUCCESS
             if(obj){
                 SyncData* data = id2data(obj,ACQUIRE)
                 assert(data)
                 data->mutex.lock();
             }else{
                 return fail ;
             }
             return OBJC_SYNC_SUCCESS
         }
         */
        
        /*
           SyncData
         1、 SyncData是可以重用的
         2、存在全局的map中
         
         typedef struct alignas(CachLineSize) SyncData {
             struct SyncData* nextData;
             DisguisedPtr<objc_object> object;
             int32_t threadCount;
             recursive_mutex mutex; // 互斥量
         }SyncData;
         
         在全局以链表的方式存储:
         [
           SyncData{
             nextData = N2;
             object = ObjA;
             threadCount = 1
             mutex = mutexObj1
           }
         ]
         
         synchronized(A) -->  synchronized(A)  --> synchronized(B) --> synchronized(C)
         1、如果链表有结点可重用则直接使用
         2、如果发现有相同的object，则设置当前结点threadCount+1
         3、如果发现没有，则在链表头部插入
         */
      
     
    }
}
