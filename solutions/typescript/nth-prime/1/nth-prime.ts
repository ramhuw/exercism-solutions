export function nth(n: number): number {
  if (n < 1) {
    throw 'Prime is not possible'
  }
  let p = 2
  let primes: number[] = []
  while (primes.length < n) {
    primes.push(p)
    if (primes.length == n) {
      break
    }
    p = p + 1
    while (primes.some(d => p % d == 0)) {
      p += 1
    }
  }
  return p
}
