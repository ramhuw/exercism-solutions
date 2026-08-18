fun translate(rna: String?): List<String> {
    val ans: MutableList<String> = mutableListOf()
    var i = 0
    val l = rna?.length ?: 0
    val map: Map<String, String> = mapOf("AUG" to "Methionine", "UUU" to "Phenylalanine", "UUC" to "Phenylalanine", "UUA" to "Leucine", "UUG" to "Leucine", "UCU" to "Serine", "UCC" to "Serine", "UCA" to "Serine", "UCG" to "Serine", "UAU" to "Tyrosine", "UAC" to "Tyrosine", "UGU" to "Cysteine", "UGC" to "Cysteine", "UGG" to "Tryptophan", "UAA" to "STOP", "UAG" to "STOP", "UGA" to "STOP")
    val r = rna ?: ""
    while (i != l) {
        if (i + 3 > l) {
            throw(IllegalArgumentException("Invalid condon"))
        }
        val condon = r.substring(i, i + 3)
        i += 3
        if (!map.containsKey(condon)) {
            throw(IllegalArgumentException("Invalid condon"))
        }
        if (map[condon] == "STOP") {
            break
        } else {
            ans.add(map[condon]!!)
        }
        
    }
    return ans
}
