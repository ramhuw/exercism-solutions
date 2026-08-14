pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    (1..limit).filter(|i| factors.iter().any(|j| j != &0 && i % j == 0)).fold(0, |acc, a| acc + a)
}
