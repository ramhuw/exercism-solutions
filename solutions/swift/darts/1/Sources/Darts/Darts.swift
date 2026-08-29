func dartScore(x: Double, y: Double) -> Int {
  let r2 = x * x + y * y
  if r2 > 100 {
    return 0
  } else if r2 > 25 {
    return 1
  } else if r2 > 1 {
    return 5
  } else {
    return 10
  }
}
