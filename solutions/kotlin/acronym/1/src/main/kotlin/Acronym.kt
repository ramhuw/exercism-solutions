object Acronym {
    fun generate(phrase: String) : String {
        var ans = StringBuilder()
        var prev: Char? = null
        for (i in phrase.indices) {
            if ((prev == null || prev.isWhitespace() || prev == '-' || prev == '_') && phrase[i].isLetter()) {
                ans.append(phrase[i].uppercaseChar())
            }
            prev = phrase[i]
        }
        return ans.toString()
    }
}
