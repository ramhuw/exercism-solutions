object Pangram {

    fun isPangram(input: String): Boolean {
        return input.lowercase().toSet().count { it.isLetter() } == 26
    }
}
