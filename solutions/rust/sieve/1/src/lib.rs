pub fn primes_up_to(upper_bound: u64) -> Vec<u64> {
    let mut v = vec![true; upper_bound as usize+1];
    v[0] = false;
    v[1] = false;
    let mut ans = vec![];
    for p in 2..=upper_bound as usize {
        if v[p] {
            ans.push(p as u64);
            for q in ((2*p)..=upper_bound as usize).step_by(p) {
                v[q] = false;
            }
        }
    }
    ans
}
