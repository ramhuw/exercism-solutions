object PrimeFactorCalculator {

    fun primeFactors(int: Int): List<Int> {
        var int = int
        var ans = mutableListOf<Int>()
        var p = 2
        while (int != 1) {
            while (int % p == 0) {
                int /= p
                ans.add(p)
            }
            p += 1
        }
        return ans
    }

    fun primeFactors(long: Long): List<Long> {
        var long = long
        var ans = mutableListOf<Long>()
        var p: Long = 2
        while (long != 1L) {
            while (long % p == 0L) {
                long /= p
                ans.add(p)
            }
            p += 1
        }
        return ans
    }
}
