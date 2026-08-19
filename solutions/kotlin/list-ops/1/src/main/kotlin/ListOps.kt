fun <T> List<T>.customAppend(list: List<T>): List<T> {
    val ans: MutableList<T> = mutableListOf()
    for (a in this) {
        ans.add(a)
    }
    for (b in list) {
        ans.add(b)
    }
    return ans
}

fun List<Any>.customConcat(): List<Any> {
    val ans: MutableList<Any> = mutableListOf()
    fun add(a: Any) {
        if (a is List<*>) {
            for (b in a) {
                if (b != null) {
                    add(b)
                }
            }
        } else {
            ans.add(a)
        }
    }
    for (a in this) {
        add(a)
    }
    return ans
}

fun <T> List<T>.customFilter(predicate: (T) -> Boolean): List<T> {
    val ans: MutableList<T> = mutableListOf()
    for (i in this.indices) {
        if (predicate(this[i])) {
            ans.add(this[i])
        }
    }
    return ans
}

val List<Any>.customSize: Int get() {
    var ans = 0
    for (i in this.indices) {
        ans += 1
    }
    return ans
}

fun <T, U> List<T>.customMap(transform: (T) -> U): List<U> {
    val ans: MutableList<U> = mutableListOf()
    for (a in this) {
        ans.add(transform(a))
    }
    return ans
}

fun <T, U> List<T>.customFoldLeft(initial: U, f: (U, T) -> U): U {
    var ans = initial
    for (a in this) {
        ans = f(ans, a)
    }
    return ans
}

fun <T, U> List<T>.customFoldRight(initial: U, f: (T, U) -> U): U {
    var ans = initial
    for (a in this.customReverse()) {
        ans = f(a, ans)
    }
    return ans
}

fun <T> List<T>.customReverse(): List<T> {
    val ans: MutableList<T> = mutableListOf()
    for (a in this) {
        ans.addFirst(a)
    }
    return ans
}
