object Darts {

    fun score(x: Number, y: Number /* choose proper types! */): Int {
        val x = x.toDouble()
        val y = y.toDouble()
        val r2 = x*x + y*y
        return when {
            r2 > 100 -> 0
            r2 > 25 -> 1
            r2 > 1 -> 5
            else -> 10
        }
    }
}
