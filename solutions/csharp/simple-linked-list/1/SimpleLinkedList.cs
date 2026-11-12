using Microsoft.VisualBasic;

public class SimpleLinkedList<T>
{
    public int Count => _count;
    private int _count = 0;

    class Node<T>(T val)
    {
        public T val = val;
        public Node<T>? prev = null;
        public Node<T>? next = null;
        
    }
    private Node<T>? Head;

    public SimpleLinkedList()
    {
        Head = null;
    }

    public SimpleLinkedList(T value) {
        Head = new Node<T>(value);
    }
    public SimpleLinkedList(IEnumerable<T> iter)
    {
        Node<T>? Current = null;
        foreach (T i in iter)
        {
            if (Current == null)
            {
                Head = new Node<T>(i);
                Current = Head;
            } else
            {
                Current.next = new Node<T>(i);
                Current.next!.prev = Current;
                Current = Current.next;
            }
        }
    }
    
    public void Push(T value)
    {
        Node<T> NewHead = new Node<T>(value);
        if (Head != null)
        {
            Head.prev = NewHead;
            NewHead.prev = Head;
        } 
        Head = NewHead;
        _count += 1;
    }

    public T? Pop()
    {
        if (Head != null)
        {
            var ans = Head.val;
            Head = Head.next;
            if (Head != null)
            {
                Head.prev = null;
            }
            return ans;
        } else
        {
            return default;
        }
    }
}