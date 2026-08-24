//Solution goes in Sources
class Node<T> {
    let value: T
    var next: Node<T>?
    var prev: Node<T>?
    init(_ value: T) {
        self.value = value
        self.next = nil
        self.prev = nil
    }
}

class Deque<T: Equatable> {
    var head: Node<T>? = nil
    var tail: Node<T>? = nil

    func push(_ value: T) {
        let newTail = Node(value)
        newTail.prev = tail
        tail?.next = newTail
        tail = newTail
        if head == nil {
            head = newTail
        }
    }

    func pop() -> T? {
        let ans = tail?.value
        if head?.next == nil {
            head = nil
        }
        tail = tail?.prev
        tail?.next = nil
        return ans
    }

    func shift() -> T? {
        let ans = head?.value
        if tail?.prev == nil {
            tail = nil
        }
        head = head?.next
        head?.prev = nil
        return ans
    }

    func unshift(_ value: T) {
        let newHead = Node(value)
        if tail == nil {
            tail = newHead
        }
        newHead.next = head
        head?.prev = newHead
        head = newHead
    }

    var count: Int {
        var ans = 0
        var h = head
        while h != nil {
            ans += 1
            h = h?.next
        }
        return ans
    }

    func delete(_ value: T) {
        if head?.value == value {
            if head === tail {
                tail = nil
            }
            head = head?.next
            head?.prev = nil

        } else {
            var current = head
        while current != nil {
            if current?.next?.value == value {
                let end = current?.next?.next
                current?.next = end
                end?.prev = current
                if end == nil {
                    tail = current
                }
                return
            }
            current = current?.next
        }
        }
        
    }

}
