class Deque<T> {
    
    var left: Node<T>? = null
    var right: Node<T>? = null

    fun push(value: T) {
        val newNode = Node<T>(value)
        if (right == null) {
            left = newNode
            right = newNode
        } else {
            right!!.right = newNode
            newNode.left = right
            right = newNode
        }
    }

    fun pop(): T? {
        val ans = right?.value
        if (left == right) {
            left = null
            right = null
        } else {
            right = right?.left
            right?.right = null
        }
        return ans
    }

    fun unshift(value: T) {
        val newNode = Node<T>(value)
        if (left == null) {
            left = newNode
            right = newNode
        } else {
            left?.left = newNode
            newNode.right = left
            left = newNode
        }
    }

    fun shift(): T? {
        val ans = left?.value
        
        if (left == right) {
            left = null
            right = null
        } else {
            left = left?.right
            left?.left = null
        }
        
        return ans
    }
}

class Node<T>(val value: T) {
    var left: Node<T>? = null
    var right: Node<T>? = null
}