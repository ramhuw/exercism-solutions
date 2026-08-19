object Hamming {

    fun compute(leftStrand: String, rightStrand: String): Int {
        require(leftStrand.length == rightStrand.length)
        return leftStrand.zip(rightStrand).count { it.first != it.second }
    }
}
