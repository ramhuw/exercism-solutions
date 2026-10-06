module DifferenceOfSquares

export
squareOfSum : Integer -> Integer
squareOfSum number = (number + 1) * number * (number + 1) * number `div` 4

export
sumOfSquares : Integer -> Integer
sumOfSquares 0 = 0
sumOfSquares x = sumOfSquares (x-1) + x * x

export
differenceOfSquares : Integer -> Integer
differenceOfSquares number = squareOfSum number - (sumOfSquares number)
