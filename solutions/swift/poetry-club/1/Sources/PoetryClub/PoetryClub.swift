import Foundation

func splitOnNewlines(_ poem: String) -> [String] {
  return poem.components(separatedBy: "\n")
}

func frontDoorPassword(_ phrase: String) -> String {
  return phrase.components(separatedBy: "\n").map {
    l in
    if l.isEmpty {
      "_"
    } else {
      String(l.prefix(1))
    }
  }.reduce("") {
    acc, a in acc + a
  }
}

func backDoorPassword(_ phrase: String) -> String {
  return phrase.components(separatedBy: "\n").map {
    l in l.trimmingCharacters(in: .whitespaces).suffix(1)
  }.joined() + ", please"
}

func secretRoomPassword(_ phrase: String) -> String {
  phrase.components(separatedBy: "\n").enumerated().map {
    i, a in Array(a)[i].uppercased()
  }.joined() + "!"
}
