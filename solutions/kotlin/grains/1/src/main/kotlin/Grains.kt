import java.math.BigInteger

object Board {

    fun getGrainCountForSquare(number: Int): BigInteger {
        if (number <= 0 || number > 64) {
            throw IllegalArgumentException("Invalid input: $number");
        }
        return BigInteger.TWO.pow(number - 1)
    }

    fun getTotalGrainCount(): BigInteger {
        var ans = BigInteger.ZERO
        var p = BigInteger.ONE
        for (i in 1..64) {
            ans = ans.add(p)
            p = p + p
        }
        return ans
    }
}
