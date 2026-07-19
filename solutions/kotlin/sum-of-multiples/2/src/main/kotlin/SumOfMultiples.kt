object SumOfMultiples {

    fun sum(factors: Set<Int>, limit: Int): Int {
        var ans = 0
        for (i in 1 until 20) {
            for (f in factors) {
                if (i % f == 0) {
                    ans += i
                    break
                }
            }
        }
        return ans
    }
}
