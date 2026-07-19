object SumOfMultiples {

    fun sum(factors: Set<Int>, limit: Int): Int {
        var ans = 0
        for (i in 1 until 20) {
            var flag = true
            for (f in factors) {
                if (i % f == 0) {
                    flag = false
                    break
                }
            }
            if (flag) {
                ans += i
            }
        }
        return ans
    }
}
