export function decodedResistorValue(arr: string[]): string {
  const a = map.get(arr[0])!
  const b = map.get(arr[1])!
  let c = map.get(arr[2])!
  let ans = a.toString() + b.toString()
  if (c >= 3) {
    ans += '0'.repeat(c - 3)
    ans += ' kiloohms'
  } else {
    ans += '0'.repeat(c)
    ans += ' ohms'
  }
  return ans
}

const map = new Map([
  ['black', 0],
  ['brown', 1],
  ['red', 2],
  ['orange', 3],
  ['yellow', 4],
  ['green', 5],
  ['blue', 6],
  ['violet', 7],
  ['grey', 8],
  ['white', 9]
])


