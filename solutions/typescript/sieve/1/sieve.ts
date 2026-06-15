export function primes(n: number): number[] {
  let sieve: boolean[] = Array(n+1).fill(true)
  let p = 2
  while (p <= n) {
    if (sieve[p]) {
        for (let i = 2; p*i <= n; i++) {
        sieve[p*i] = false;
        }
    }
    p += 1
  }
  let ans = []
  for (let i = 0; i <= n; i++) {
    if (sieve[i] && i >= 2) {
        ans.push(i)
    }
  }
  return ans
}

