class CollatzConjecture {
  static func steps(_ number: Int) throws -> Int? {
    if number <= 0 {
      return nil
    } 
    var ans = 0
    var n = number
    while n != 1 {
      if n % 2 == 0 {
        n /= 2
      } else {
        n = 3 * n + 1
      }
      ans += 1
    }
    return ans
  }
}
