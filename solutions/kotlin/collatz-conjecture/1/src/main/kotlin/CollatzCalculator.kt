object CollatzCalculator {
    fun computeStepCount(start: Int): Int {
        if (start <= 0) {
            throw IllegalArgumentException()
        }
        var n = start
        var count = 0
        while (n != 1) {
            if (n % 2 == 0) {
                n /= 2
            } else {
                n *= 3
                n += 1
            }
            count += 1
        }
        return count
    }
}
