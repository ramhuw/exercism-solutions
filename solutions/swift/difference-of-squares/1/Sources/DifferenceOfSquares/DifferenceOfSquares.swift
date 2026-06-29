import Foundation

class Squares {
  private let n: Int
  init (_ n: Int) {
    self.n = n
  }

  var sumOfSquares : Int {
    get {
      return (1...self.n).map {
      a in a*a
    }.reduce(0) {
      acc, a in acc + a
    }
    }
  }

  var squareOfSum : Int {
    get {
      let a = (1...self.n).reduce(0) {
      acc, a in acc + a
    }
    return a*a
    }
  }

  var differenceOfSquares : Int {
    get {
      return self.squareOfSum - self.sumOfSquares
    }
  }
}
