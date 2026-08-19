object PascalsTriangle {

    fun computeTriangle(rows: Int): List<List<Int>> {
        require(rows >= 0)
        val ans: MutableList<List<Int>> = mutableListOf()
        for (i in 0..<rows) {
            val line: MutableList<Int> = mutableListOf(1)
            for (j in 1..<i) {
                line.add(ans[i-1][j-1] + ans[i-1][j])
            }
            if (i > 0) {
                line.add(1)
            }
            ans.add(line)
        }
        return ans
    }
}
