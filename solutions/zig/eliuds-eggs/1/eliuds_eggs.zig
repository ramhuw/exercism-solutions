pub fn eggCount(number: usize) usize {
    var n = number;
    var ans: usize = 0;
    while (n != 0) {
        ans += n & 1;
        n >>= 1;
    }
    return ans;
}
