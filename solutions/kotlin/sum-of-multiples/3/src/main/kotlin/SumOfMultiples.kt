object SumOfMultiples {

    fun sum(factors: Set<Int>, limit: Int): Int {
        var ans = 0
        for (i in 1 until limit) {
            for (f in factors) {
                if (f != 0 && i % f == 0) {
                    ans += i
                    break
                }
            }
        }
        return ans
    }
}
