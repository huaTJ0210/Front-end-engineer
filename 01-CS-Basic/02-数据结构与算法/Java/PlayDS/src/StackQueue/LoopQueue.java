public class LoopQueue<E> implements Queue<E> {

    private E[]data;
    private int front;
    private int tail;
    private int size;

    public LoopQueue(int capacity){
        data = (E[])new Object[capacity + 1];
        front = 0;
        tail = 0;
        size = 0;
    }

    public LoopQueue(){
        this(10);
    }

    public int  getCapacity(){
        return data.length - 1;
    }


    @Override
    public void enqueue(E e) {
        if ((tail+1)%data.length == front){
            resize(getCapacity() * 2);
        }
        data[tail] = e;
        tail = (tail + 1) % data.length;
        size ++;
    }

    @Override
    public E dequeue() {
        if (front == tail){
            throw new IllegalArgumentException("Queue is empty");
        }
        E e = data[front];
        data[front] = null;
        front = (front + 1) % getCapacity();
        size--;
        if (size == getCapacity()/4 && getCapacity() / 2 !=0){
            resize(getCapacity()/2);
        }
        return e;
    }

    @Override
    public E getFront() {
        if (front == tail){
            throw new IllegalArgumentException("Queue is empty");
        }
        return data[front];
    }

    @Override
    public int getSize() {
        return size;
    }

    @Override
    public boolean isEmpty() {
        return front == tail;
    }

    private void resize(int newCapacity){
        E[] newData = (E[])new Object[newCapacity + 1];
        for (int i = 0;i<size;i++){
            newData[i] = data[(i + front)%data.length];
        }
        data = newData;
        front = 0;
        tail = size;
    }

    @Override
    public String toString() {
        StringBuilder res = new StringBuilder();
        res.append(String.format("Queue: size=%d , capacity=%d \n",size,getCapacity()));
        res.append("front [");
        for (int i = front;i!=tail;i=(i+1) %data.length){
            res.append(data[i]);
            if ((i + 1) % data.length !=tail){
                res.append(",");
            }
        }
        res.append("]tail");
        return res.toString();
    }

    public static void main(String[] args){
        LoopQueue<Integer> loopQueue = new LoopQueue<>(10);
        for(int i = 0;i<10;i++){
            loopQueue.enqueue(i);
            System.out.println(loopQueue);
            if (i%3 == 2){
                loopQueue.dequeue();
                System.out.println(loopQueue);
            }
        }
    }
}
