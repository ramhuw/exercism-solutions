object BinarySearch {
    fun search(list: List<Int>, item: Int): Int {
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
        require(list[left] == item)
        return left
    }
}
