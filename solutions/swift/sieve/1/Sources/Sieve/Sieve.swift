func sieve(limit: Int) -> [Int] {
  if limit < 2 {
    return []
  }
  var flags = Array(repeating: true, count: limit + 1)
  flags[0] = false
  flags[1] = false

  for i in 2...limit {
    if flags[i] {
      var x = 2 * i
      while x <= limit {
        flags[x] = false
        x += i
      }
    }
  }
  var ans: [Int] = []
  for i in 2...limit {
    if flags[i] {
      ans.append(i)
    }
  }
  return ans
}
