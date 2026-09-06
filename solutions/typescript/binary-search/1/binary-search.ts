export function find(haystack: number[], needle: number): number | never {
  if (haystack.length === 0) {
    throw new Error('Value not in array')
  }
  let l = 0
  let r = haystack.length - 1
  while (l < r) {
    const m = Math.floor((l + r + 1) / 2)
    if (haystack[m] <= needle) {
      l = m
    } else {
      r = m - 1
    }
  }
  if (haystack[l] === needle) {
    return l
  } else {
    throw new Error('Value not in array')
  }
}
