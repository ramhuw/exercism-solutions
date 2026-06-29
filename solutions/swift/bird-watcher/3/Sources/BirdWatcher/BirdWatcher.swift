func totalBirdCount(_ birdsPerDay: [Int]) -> Int {
  return birdsPerDay.reduce(0) {
    acc, a in acc + a
  }
}

func birdsInWeek(_ birdsPerDay: [Int], weekNumber: Int) -> Int {
  return birdsPerDay.enumerated().filter {
    i, b in
    i >= (weekNumber - 1) * 7 &&
    i < (weekNumber) * 7
  }.map {
    i, b in b
  }.reduce(0) {
    acc, a in acc + a
  }
}

func fixBirdCountLog(_ birdsPerDay: [Int]) -> [Int] {
  var ans: [Int] = birdsPerDay
  for i in 0..<birdsPerDay.count {
    if i & 1 == 0 {
      ans[i] += 1
    }
  }
  return ans
}
