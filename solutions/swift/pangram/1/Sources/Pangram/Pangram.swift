import Foundation

func isPangram(_ text: String) -> Bool {
  return Set(Array(text.lowercased()).filter {
    $0.isLetter
  }).count == 26
}
