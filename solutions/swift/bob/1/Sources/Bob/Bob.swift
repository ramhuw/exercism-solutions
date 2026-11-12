import Foundation
class Bob {
  static func response(_ message: String) -> String {
    let trimmed = message.trimmingCharacters(in: .whitespacesAndNewlines)
    let isQuestion = trimmed.last == "?"
    let isYell = Array(trimmed).filter {
      c in c.isLetter
    }
    .allSatisfy({ c in c.isUppercase })
    if trimmed == "" {
      return "Fine. Be that way!"
    } else if isQuestion {
      if isYell {
        return "Calm down, I know what I'm doing!"
      } else {
        return "Sure."
      }
    } else if isYell {
      return "Whoa, chill out!"
    } else {
      return "Whatever."
    }
  }
}
