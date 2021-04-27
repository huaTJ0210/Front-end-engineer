### Isolates and event loops

>
>
> (1) 如何创建一个隔离区：
>
>  Isolate.spawn() 或者 Flutter中的 compute() : 
>
> (2) Isolate：
>
>  2.1：独立的内存空间、单独的线程、独立的事件循环
>
>  2.2：好处：内存空间的创建和回收不需要锁，只有一个线程，
>
>  2.3：不同的Isolate之间可以互相发送消息
>
> (3) 事件循环

<img src="./res/Dart asynchronous programming_ Isolates and event loops.png" alt="Dart asynchronous programming_ Isolates and event loops"/>