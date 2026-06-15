export function score(x: number, y: number): number {
  const rs = x**2 + y**2;
  if (rs > 100) {
    return 0
  } else if (rs > 25) {
    return 1
  } else if (rs > 1) {
    return 5
  } else {
    return 10
  }
}
