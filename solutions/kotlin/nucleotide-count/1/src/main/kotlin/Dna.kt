class Dna(val dna: String) {
    val counts: MutableMap<Char, Int>

    init {
        counts = mutableMapOf('A' to 0, 'C' to 0, 'G' to 0, 'T' to 0)
        for (c in dna) {
            if (counts.containsKey(c)) {
                counts[c] = counts[c]!! + 1
            } else {
                throw (IllegalArgumentException("dna"))
            }
        }
    }

    val nucleotideCounts: Map<Char, Int>
        get() {
            return counts
        }
}
