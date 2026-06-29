func totalBirdCount(_ birdsPerDay: [Int]) -> Int {
  return birdsPerDay.reduce(0) {
    acc, a in acc + a
  }
}

func birdsInWeek(_ birdsPerDay: [Int], weekNumber: Int) -> Int {
  return totalBirdCount(birdsPerDay) / weekNumber
}

func fixBirdCountLog(_ birdsPerDay: [Int]) -> [Int] {
  var ans: [Int] = birdsPerDay
  for i in 0..<birdsPerDay.count {
    if i & 1 == 1 {
      ans[i] += 1
    }
  }
  return ans
}
