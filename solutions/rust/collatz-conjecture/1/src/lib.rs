pub fn collatz(n: u64) -> Option<u64> {
    match n {
        x if x <= 0 => None,
        1 => Some(0),
        x if x % 2 == 0 => collatz(n / 2).map(|x| x + 1),
        _ => collatz(3 * n + 1).map(|x| x + 1),
    }
}
