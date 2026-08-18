fun transcribeToRna(dna: String): String = dna.map(::t).joinToString("")

fun t(d: Char): Char {
    return when (d) {
        'A' -> 'U'
        'T' -> 'A'
        'C' -> 'G'
        'G' -> 'C'
        else -> throw IllegalArgumentException("")
    }
}