public class Main {

    public static void main(String[] args) {

        // 栈： 先进后出  ：实际使用： （1）undo（撤销）（2）程序调用的系统栈

//        ArrayStack<Integer> arrayStack = new ArrayStack<>();
//        for (int i = 0 ;i < 10 ; i++){
//            arrayStack.push(i);
//        }
//        System.out.println(arrayStack);

        // --- 括号匹配问题 --
//        Recursion.SolutionOne solutionOne = new Recursion.SolutionOne();
//        boolean isValid = solutionOne.isValidOne("");
//        System.out.println(isValid);

        // 队列 ：先进先出

        ArrayQueue<Integer> arrayQueue = new ArrayQueue<>(10);
        for (int i = 0; i < 10 ; i++){
            arrayQueue.enqueue(i);
        }
        System.out.println(arrayQueue);

        arrayQueue.dequeue();
        arrayQueue.dequeue();

        System.out.println(arrayQueue);
        arrayQueue.enqueue(666);
        System.out.println(arrayQueue);
    }
}
