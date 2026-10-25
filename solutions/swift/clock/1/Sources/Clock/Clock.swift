import Foundation

struct Clock: Equatable {
  let hours: Int
  let minutes: Int
  init(hours: Int, minutes: Int) {
    var m = 60 * hours + minutes
    if m < 0 {
      m = m % (24 * 60) + 24 * 60
    } else {
      m = m % (24 * 60)
    }
    self.hours = m / 60
    self.minutes = m % 60
  }

  var description: String {
    let a = hours < 10 ? "0" + String(hours) : String(hours)
    let b = minutes < 10 ? "0" + String(minutes) : String(minutes)
    return "\(a):\(b)"
  }

  func add(minutes: Int) -> Self {
    return Self(hours: self.hours, minutes: self.minutes + minutes)
  }
  func subtract(minutes: Int) -> Self {
    return Self(hours: self.hours, minutes: self.minutes - minutes)
  }
}
