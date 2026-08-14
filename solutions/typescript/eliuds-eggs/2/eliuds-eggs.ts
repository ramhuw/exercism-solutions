//
// This is only a SKELETON file for the 'Pop Count' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const eggCount = (displayValue: number): number => {
  let ans = 0
  let n = displayValue
  while (n != 0) {
    if (n % 2 = 1) {
      ans += 1
    }
    n /= 2
  }
  return ans
}
