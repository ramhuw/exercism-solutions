pub fn square(s: u32) -> u64 {
    2u64.pow(s-1)
}

pub fn total() -> u64 {
    let mut p = 1;
    let mut ans = 1;
    for _ in 1..64 {
        p *= 2;
        ans += p;
    }
    ans
}
