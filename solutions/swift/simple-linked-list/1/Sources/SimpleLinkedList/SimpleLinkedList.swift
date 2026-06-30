//Solution goes in Sources

class Element<T> {
    let value: T?
    var next: Element<T>?

    init (_ value: T? = nil, _ next: Element<T>? = nil) {
        self.value = value
        self.next = next
    }

    func toArray() -> [T] {
        guard let value = self.value else {
            return []
        }
        guard let next = self.next else {
            return [value]
        } 
        return [value] + next.toArray()
    }

    static func fromArray(_ arr: [T]) -> Element<T> {
        if arr.isEmpty {
            return Element<T>()
        } else {
            return Element<T>(arr.first, Element<T>.fromArray(Array(arr[1...])))
        }
    }

    func reverseElements() -> Element<T> {
        guard let value = self.value else {
            return self
        }
        guard let start = self.next else {
            return self
        }
        let head = start.reverseElements()
        var current = head
        if current.value == nil {
            return self
        }
        while current.next != nil {
            current = current.next!
        }
        current.next = Element<T>(value, nil)
        return head
    }
}
