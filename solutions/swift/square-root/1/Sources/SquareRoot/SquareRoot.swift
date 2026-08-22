struct SquareRoot {
   static func squareRoot(_ n: Int) throws -> Int {
      if n < 0 {
         throw(DomainError.Negative)
      }
      var left = Int(0)
      var right = n
      while left < right {
         let middle = (left + right + 1) / Int(2)
         if n / middle >= middle {
            left = middle
         } else {
            right = middle - 1
         }
      }
      return left
   }

   enum DomainError: Error {
      case Negative
   }
}
