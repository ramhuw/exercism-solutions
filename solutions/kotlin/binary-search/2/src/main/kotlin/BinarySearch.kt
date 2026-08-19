import java.util.NoSuchElementException
object BinarySearch {
    fun search(list: List<Int>, item: Int): Int {
        if (list.isEmpty()) {
            throw NoSuchElementException()
        }
        var left = 0
        var right = list.size - 1
        while (left < right) {
            val middle = (left + right + 1) / 2
            if (list[middle] <= item) {
                left = middle
            } else {
                right = middle - 1
            }
        }
        if (list[left] == item) {
            return left
        } else {
            throw NoSuchElementException()
        }
    }
}
