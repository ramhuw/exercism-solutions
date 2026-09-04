class Anagram(rawWord: String) {
    // TODO: implement proper constructor to complete the task
    val word = rawWord.lowercase().toList()

    fun match(anagrams: Collection<String>): Set<String> {
        val ans: MutableSet<String> = mutableSetOf()
        for (w in anagrams) {
            val v = w.lowercase().toList()
            if (v.sorted() == word.sorted() && v != word) {
                ans.add(w)
            }
        }
        return ans
    }
}
