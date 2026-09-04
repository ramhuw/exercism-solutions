class Allergies(val n: Int) {
    // TODO: implement proper constructor to complete the task

    fun getList(): List<Allergen> {
        val ans: MutableList<Allergen> = mutableListOf()
        for (i in 0..<8) {
            if (n and (1 shl i) != 0) {
                ans.add(Allergen.entries[i])
            }
        }
        return ans
    }

    fun isAllergicTo(allergen: Allergen): Boolean {
        return n and (1 shl allergen.ordinal) != 0
    }
}
