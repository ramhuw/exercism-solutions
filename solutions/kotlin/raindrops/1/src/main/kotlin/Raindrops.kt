object Raindrops {

    fun convert(n: Int): String {
        val a = n % 3 == 0
        val b = n % 5 == 0
        val c = n % 7 == 0
        if (!a && !b && !c) {
            return n.toString()
        } else {
            var ans = ""
            if (a) {
                ans += "Pling"
            }
            if (b) {
                ans += "Plang"
            }
            if (c) {
                ans += "Plong"
            }
            return ans
        }
    }
}
