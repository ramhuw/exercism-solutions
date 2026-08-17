object Isogram {

    fun isIsogram(input: String): Boolean {
        val s: MutableSet<Char> = mutableSetOf()
        for (c in input) {
            val d = c.lowercaseChar()
            if (d.isLetter()) {
                if (d in s) {
                    return false
                }
                s.add(d)
            }
        }
        return true
    }
}
