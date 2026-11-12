class ETL {
  static func transform(_ old: [String: [String]]) -> [String: Int] {
    var ans: [String: Int] = Dictionary()
    for (k, v) in old {
        let n = Int(k)!
        for c in v {
          ans[c.lowercased()] = n
        }
    }
    return ans
  }
}
