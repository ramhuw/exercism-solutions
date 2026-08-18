object Bob {
    fun hey(input: String): String {
        val isQuestion = input.trim().isNotEmpty() && input.trim().last() == '?'
        val letters = input.filter { it.isLetter() }
        val isYell = letters.isNotEmpty() && letters == letters.uppercase()
        if (input.isBlank()) {
            return "Fine. Be that way!"
        } else if (isQuestion && isYell) {
            return "Calm down, I know what I'm doing!"
        } else if (isQuestion) {
            return "Sure."
        } else if (isYell) {
            return "Whoa, chill out!"
        } else {
            return "Whatever."
        }
    }
}
