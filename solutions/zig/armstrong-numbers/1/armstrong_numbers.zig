pub fn isArmstrongNumber(num: u128) bool {
    var n = num;
    var l: u128 = 0;
    if (n == 0) {
        l = 1;
    } else {
        while (n != 0) {
            l += 1;
            n /= 10;
        }
    }
    n = num;
    var ans: u128 = 0;
    while (n != 0) {
        ans += pow(n % 10, l);
        n /= 10;
    }
    return ans == num;
}

pub fn pow(a: u128, b: u128) u128 {
    if (b == 0) {
        return 1;
    } else {
        const p = pow(a, b / 2);
        var ans = p * p;
        if (b & 1 == 1) {
            ans *= a;
        }
        return ans;
    }
}
