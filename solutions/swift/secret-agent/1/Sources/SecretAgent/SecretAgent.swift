func protectSecret(_ secret: String, withPassword password: String) -> (String) -> String {
  func f(s: String) -> String {
    if s == password {
      return secret
    } else {
      return "Sorry. No hidden secrets here."
    }
  }
  return f
}

func generateCombination(forRoom room: Int, usingFunction f: (Int) -> Int) -> (Int, Int, Int) {
  let x = f(room)
  let y = f(x)
  let z = f(y)
  return (x, y, z)
}
