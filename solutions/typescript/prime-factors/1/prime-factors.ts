export function calculatePrimeFactors(n: number): number[] {
  if (n === 1) {
    return []
  }
  let d = 2
  while (n % d !== 0) {
    d += 1
  }
  return [d, ...calculatePrimeFactors(n/d)]
}
