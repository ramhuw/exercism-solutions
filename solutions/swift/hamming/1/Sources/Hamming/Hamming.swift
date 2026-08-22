func compute(_ dnaSequence: String, against: String) throws -> Int? {
  if dnaSequence.count != against.count {
    throw(DomainError.InvalidInput)
  }
  return zip(dnaSequence, against).count { $0 != $1 }
}

enum DomainError: Error {
  case InvalidInput
}