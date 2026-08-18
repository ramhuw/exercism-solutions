class Triangle<out T : Number>(val a: T, val b: T, val c: T) {

    // TODO: Implement proper constructor
    
    init {
        val x = a.toDouble()
        val y = b.toDouble()
        val z = c.toDouble()
        require(x + y > z && x + z > y && y + z > x)
    }

    val isEquilateral: Boolean
    get() {
        return a.toDouble() > 0 && a == b && b == c
    }
    val isIsosceles: Boolean
    get() {
        return a == b || a == c || b == c
    }
    val isScalene: Boolean = !isIsosceles
}
