class BinarySearch {
  let list: [Int]
  init(_ l: [Int]) {
    list = l.sorted()
  }
  func searchFor(_ n: Int) throws -> Int {
    var left = 0
    var right = self.list.count - 1
    while left < right {
      let middle = (left + right + 1) / 2
      if self.list[middle] <= n {
        left = middle
      } else {
        right = middle - 1
      }
    }
    if left < self.list.count && self.list[left] == n {
      return left
    } else {
      throw BinarySearchError.valueNotFound
    }
  }
}

enum BinarySearchError: Error {
  case valueNotFound
}
