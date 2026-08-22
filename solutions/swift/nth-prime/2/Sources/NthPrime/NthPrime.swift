func nthPrime(_ n: Int) throws -> Int {
  if n == 0 {
    throw(PrimeError.noZerothPrime)
  }
  var p = 2
  var primes: [Int] = []
  while primes.count < n {
    while primes.contains(where: { p % $0 == 0})  {
      p += 1
    }
    primes.append(p)
  }
  return p
}

enum PrimeError: Error {
  case noZerothPrime
}