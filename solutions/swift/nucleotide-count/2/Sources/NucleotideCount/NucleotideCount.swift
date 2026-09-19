enum NucleotideCountErrors: Error {
  case invalidNucleotide
}

class DNA {
  let strand: String
  init(strand: String) throws {
    for c in strand {
      if c != "A" && c != "T" && c != "C" && c != "G" {
        throw NucleotideCountErrors.invalidNucleotide
      }
    }
    self.strand = strand
  }
  func counts() -> [String: Int] {
    var ans: [String: Int] = ["A": 0, "T": 0, "C": 0, "G": 0]
    for c in self.strand {
      ans[String(c)] = ans[String(c)]! + 1
    }
    return ans
  }
}
