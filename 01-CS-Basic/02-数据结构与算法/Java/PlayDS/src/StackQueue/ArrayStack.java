public class ArrayStack<E> implements Stack<E> {
    Array<E> array;

    public ArrayStack(int capacity){
        array = new Array<>(capacity);
    }

    public ArrayStack(){
        this(10);
    }

    @Override
    public void push(E e) {
        array.addLast(e);
    }

    @Override
    public E pop() {
        return array.removeLast();
    }

    @Override
    public E peek() {
        return array.getLast();
    }

    @Override
    public int getSize() {
        return array.getSize();
    }

    @Override
    public boolean isEmpty() {
        return array.isEmpty();
    }

    @Override
    public String toString() {
        StringBuilder res = new StringBuilder();
        res.append(String.format("ArrayStack: size=%d,capacity \n",getSize(),array.getCapacity()));
        res.append("Stack top [");
        for (int i = getSize() - 1; i > 0 ; i--){
            res.append(array.get(i));
            if (i > 1){
                res.append(",");
            }
        }
        res.append("]");
        return res.toString();
    }
}
