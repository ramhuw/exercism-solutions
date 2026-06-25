object Darts {

    fun score(x: Float, y: Float /* choose proper types! */): Int {
        val r2 = x*x + y*y
        return when {
            r2 > 100 -> 0
            r2 > 25 -> 1
            r2 > 1 -> 5
            else -> 10
        }
    }
}
