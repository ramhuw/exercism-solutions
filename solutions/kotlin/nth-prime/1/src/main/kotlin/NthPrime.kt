object Prime {

    fun nth(n: Int): Int {
        if (n == 0) {
            throw IllegalArgumentException("There is no zeroth prime.")
        }
        var ps: MutableList<Int> = mutableListOf()
        var p = 2
        while (ps.size < n) {
            var flag = true
            for (q in ps) {
                if (p % q == 0) {
                    p += 1
                    flag = false
                    break
                }
            }
            if (flag) {
                ps.add(p)
                p += 1
            }
        }
        return ps[n-1]
    }
}
