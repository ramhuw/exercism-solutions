namespace DifferenceOfSquares

def squareOfSum (number : Nat) : Nat :=
  number^2 * (number + 1)^2 / 4

def sumOfSquares (number : Nat) : Nat :=
  if number = 0 then 0 else
  number^2 + sumOfSquares (number - 1)
termination_by number

def differenceOfSquares (number : Nat) : Nat :=
  squareOfSum number - sumOfSquares number

end DifferenceOfSquares
