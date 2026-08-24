func toLimit(_ limit: Int, inMultiples: [Int]) -> Int {
  var b = Array(repeating: false, count: limit)
  for x in inMultiples {
    var y = x
    while y != 0 && y < limit {
      b[y] = true
      y += x
    }
  }
  var ans = 0
  for i in 0..<limit {
    if b[i] {
      ans += i
    }
  }
  return ans
}
