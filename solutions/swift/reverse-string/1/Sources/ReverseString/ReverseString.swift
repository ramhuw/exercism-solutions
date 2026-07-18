func reverseString(_ input : String) -> String {
    var ans = ""
    for c in input {
        ans = String(c) + ans
    }
    return ans
}
