func newScoreBoard() -> [String: Int] {
  return [:]
}

func addPlayer(_ scores: inout [String: Int], _ name: String, _ score: Int = 0) {
  scores[name] = score
}

func removePlayer(_ scores: inout [String: Int], _ name: String) {
  scores[name] = nil
}

func resetScore(_ scores: inout [String: Int], _ name: String) {
  if let _ = scores[name] {
    scores[name] = 0
  }
}

func updateScore(_ scores: inout [String: Int], _ name: String, _ delta: Int) {
  if let oldScore = scores[name] {
    scores[name] = oldScore + delta
  }
}

func sortName(_ lhs: (String, Int), _ rhs: (String, Int)) -> Bool {
  return lhs.0 < rhs.0
}

func orderByPlayers(_ scores: [String: Int]) -> [(String, Int)] {
 return scores.sorted(by: sortName)
}

func sortScore(_ lhs: (String, Int), _ rhs: (String, Int)) -> Bool {
  return lhs.1 > rhs.1
}

func orderByScores(_ scores: [String: Int]) -> [(String, Int)] {
  return scores.sorted(by: sortScore)
}
