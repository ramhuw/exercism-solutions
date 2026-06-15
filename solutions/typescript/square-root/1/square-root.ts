export function squareRoot(radicand: number): number {
  let a = 1
  while (a*a <= radicand) {
    a += 1
  }
  return a-1
}
