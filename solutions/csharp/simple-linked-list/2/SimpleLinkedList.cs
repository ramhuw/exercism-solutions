using Microsoft.VisualBasic;
using System.Collections;

public class SimpleLinkedList<T>: IEnumerable<T>
{
    public int Count => _count;
    private int _count = 0;

    class Node<T>(T val)
    {
        public T val = val;
        public Node<T>? prev = null;
        public Node<T>? next = null;
        
    }
    private Node<T>? Head = null;

    public SimpleLinkedList()
    {
        
    }

    public SimpleLinkedList(T value) {
        Push(value);
    }
    public SimpleLinkedList(IEnumerable<T> iter)
    {
        Head = null;
        foreach (T i in iter)
        {
            Push(i);
        }
    }
    
    public void Push(T value)
    {
        Node<T> NewHead = new Node<T>(value);
        if (Head != null)
        {
            Head.prev = NewHead;
            NewHead.next = Head;
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
            _count -= 1;
            return ans;
        } else
        {
            return default;
        }
    }
    public IEnumerator<T> GetEnumerator()
    {
        for (var node = Head; node != null; node = node.next)
        {
            yield return node.val;
        }
    }
    IEnumerator IEnumerable.GetEnumerator() => GetEnumerator();
}