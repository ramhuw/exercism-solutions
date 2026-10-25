func isIsogram(_ string: String) -> Bool {
  var d: Set<String> = Set()
  for c in string {
    if c.isLetter {
      if d.contains((c.lowercased())) {
        return false
      } else {
        d.insert(c.lowercased())
      }
    }
  }
  return true
}
