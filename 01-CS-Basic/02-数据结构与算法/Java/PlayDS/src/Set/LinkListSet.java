package Set;

public class LinkListSet<E> implements Set<E> {
    private LinkList<E> linkList;

    public LinkListSet(){
        this.linkList = new LinkList<E>();
    }

    @Override
    public int getSize() {
        return linkList.getSize();
    }

    @Override
    public boolean isEmpty() {
        return linkList.isEmpty();
    }

    @Override
    public boolean contains(E e) {
        return linkList.contains(e);
    }

    @Override
    public void add(E e) {
        if (!linkList.contains(e)){
            linkList.addFirst(e);
        }
    }

    @Override
    public void remove(E e) {
        linkList.remove(e);
    }
}
