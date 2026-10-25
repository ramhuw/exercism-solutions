enum Classification {
  case perfect
  case abundant
  case deficient
}

enum ClassificationError: Error {
  case invalidInput
}

func classify(number: Int) throws -> Classification {
  if number <= 0 {
    throw ClassificationError.invalidInput
  }
  var m = 0
  for i in 1..<number {
    if i * i > number {
      break
    }
    if i * i == number {
      m += i
      break
    } else if number % i == 0 {
      m += i + (i == 1 ? 0 : number / i)
    }
  }
  if m == number {
    return .perfect
  } else if m < number {
    return .deficient
  } else {
    return .abundant
  }
}
