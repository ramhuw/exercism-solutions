
enum class Classification {
    DEFICIENT, PERFECT, ABUNDANT
}

fun classify(naturalNumber: Int): Classification {
    if (naturalNumber <= 0) {
        throw(RuntimeException())
    }
    var ans = 0
    for (i in 1..<naturalNumber) {
        if (naturalNumber % i == 0) {
            ans += i
        }
    }
    if (ans == naturalNumber) {
        return Classification.PERFECT
    } else if (ans < naturalNumber) {
        return Classification.DEFICIENT
    } else {
        return Classification.ABUNDANT
    }
}
