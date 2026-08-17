import kotlin.math.pow

object ArmstrongNumber {

    fun check(input: Int): Boolean {
        val n = input.toString().length
        var ans = 0
        var i = input
        while (i != 0) {
            ans += pow(i % 10, n)
            i /= 10
        }
        return ans == input
    }

    fun pow(a: Int, b: Int): Int {
        var a = a
        var b = b
        var x = 1
        var y = a
        while (b != 0) {
            if (b.and(1) == 1) {
                x *= y
            }
            b = b.shr(1)
            y *= y
        }
        return x
    }

}
