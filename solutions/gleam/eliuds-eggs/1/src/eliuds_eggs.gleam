pub fn egg_count(number: Int) -> Int {
  case number {
    0 -> 0
    n if n % 2 == 1 -> 1 + egg_count(n / 2)
    n -> egg_count(n / 2)
  }
}
