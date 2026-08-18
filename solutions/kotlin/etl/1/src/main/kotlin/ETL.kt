object ETL {
    fun transform(source: Map<Int, Collection<Char>>): Map<Char, Int> {
        val ans: MutableMap<Char, Int> = mutableMapOf()
        for ((k, v) in source) {
            for (c in v) {
                ans[c.lowercaseChar()] = k
            }
        }
        return ans
    }
}
