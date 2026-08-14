class Squares(val n: Int) {
    //TODO: implement proper constructor
    

    fun sumOfSquares(): Int {
        var ans = 0
        for (i in 0..n) {
            ans += i*i
        }
        return ans
    }

    fun squareOfSum(): Int {
        var ans = 0
        for (i in 0..n) {
            ans += i
        }
        ans *= ans
        return ans
    }

    fun difference(): Int {
        return squareOfSum() - sumOfSquares()
    }
}
