func getCard(at index: Int, from stack: [Int]) -> Int {
  return stack[index]
}

func setCard(at index: Int, in stack: [Int], to newCard: Int) -> [Int] {
  var stack = stack
  if index >= 0 && index < stack.count {
    stack[index] = newCard
  }
  return stack
}

func insert(_ newCard: Int, atTopOf stack: [Int]) -> [Int] {
  var stack = stack
  stack.append(newCard)
  return stack
}

func removeCard(at index: Int, from stack: [Int]) -> [Int] {
  var stack = stack
  if index >= 0 && index < stack.count {
    stack.remove(at: index)
  }
  return stack
}

func insert(_ newCard: Int, at index: Int, from stack: [Int]) -> [Int] {
  var stack = stack
  if index >= 0 && index <= stack.count {
    stack.insert(newCard, at: index)
  }
  return stack
}

func checkSizeOfStack(_ stack: [Int], _ size: Int) -> Bool {
  return stack.count == size
}
