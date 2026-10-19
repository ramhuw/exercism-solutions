func raindrops(_ number: Int) -> String {
  if number % 3 != 0 && number % 5 != 0 && number % 7 != 0 {
    return String(number)
  } else {
    var ans = ""
    if number % 3 == 0 {
      ans += "Pling"
    }
    if number % 5 == 0 {
      ans += "Plang"
    }
    if number % 7 == 0 {
      ans += "Plong"
    }
    return ans
  }
}
