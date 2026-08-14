object EliudsEggs {

    fun eggCount(number: Int): Int{
        var n = number
        var ans = 0
        while (n != 0) {
            ans += n and 1
            n = n shr 1
        }
        return ans
    }
}
