pub fn factors(n: u64) -> Vec<u64> {
    let mut n = n;
    let mut p = 2;
    let mut ans = vec![];
    while n != 1 {
        while n % p != 0 {
            p += 1;
            if p * p > n {
                p = n;
            }
        }
        while n % p == 0 {
            ans.push(p);
            n /= p;
        }
        p += 1;
    }
    ans
}
