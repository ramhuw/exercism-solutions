struct Grains {
  static func square(_ num: Int) throws -> UInt64 {
    if num < 1 {
      throw(GrainsError.inputTooLow)
    } else if num > 64 {
      throw(GrainsError.inputTooHigh)
    } else {
      return 1 << (num - 1)
    }
  }

  static var total: UInt64 {
    get {
      var ans = UInt64(0)
      for i in 0..<64 {
        ans += 1 << i
      }
      return ans
    }
  }
}

enum GrainsError: Error {
  case inputTooLow
  case inputTooHigh
}