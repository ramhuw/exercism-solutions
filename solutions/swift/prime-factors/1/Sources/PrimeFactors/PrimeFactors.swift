func primeFactors(_ number: Int64) -> [Int64] {
  // Write your code for the 'PrimeFactors' exercise in this file.
  if number <= 1 {
    return []
  } else {
    var p: Int64 = 2;
    var n = number
    var ans: [Int64] = []
    while n != 1 {
      while n % p != 0 {
        p += 1;
      }
      while n % p == 0 {
        ans.append(p)
        n /= p
      }
      p += 1
    }
    return ans
  }
}
