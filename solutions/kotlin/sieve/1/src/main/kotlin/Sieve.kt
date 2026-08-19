object Sieve {

    fun primesUpTo(upperBound: Int): List<Int> {
        require(upperBound >= 0)
        val list = Array<Boolean>(upperBound + 1) { true }
        list[0] = false
        if (upperBound >= 1) {
            list[1] = false
        }
        for (p in 2..upperBound) {
            if (list[p]) {
                for (q in ((2*p..upperBound).step(p))) {
                    list[q] = false
                }
            }
        }
        return list.zip(0..upperBound).filter {
            it.first
        }.map {
            it.second
        }
    }
}
