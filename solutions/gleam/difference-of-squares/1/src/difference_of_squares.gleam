pub fn sum(n: Int) -> Int {
  case n == 0 {
    True -> 0
    False -> n + sum(n - 1)
  }
}

pub fn square_of_sum(n: Int) -> Int {
  let x = sum(n)
  x * x
}

pub fn sum_of_squares(n: Int) -> Int {
  case n {
    0 -> 0
    _ -> n * n + sum_of_squares(n - 1)
  }
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
