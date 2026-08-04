pub fn nth(n: u32) -> u32 {
    let mut p = 2;
    let mut primes = Vec::new();
    'outer: while &primes.len() <= &(n as usize) {
        for &prime in &primes {
            if p % prime == 0 {
                p += 1;
                continue 'outer;
            }
        }
        primes.push(p);
        p += 1;
    }
    primes[n as usize]
}
