module DifferenceOfSquares
  ( differenceOfSquares
  , squareOfSum
  , sumOfSquares
  ) where
import Prelude
import Effect.Exception.Unsafe (unsafeThrow)

differenceOfSquares :: Int -> Int
differenceOfSquares = \x -> squareOfSum x - sumOfSquares x

squareOfSum :: Int -> Int
squareOfSum x = y * y 
  where
    y = ((1 + x) * x / 2)

sumOfSquares :: Int -> Int
sumOfSquares 0 = 0
sumOfSquares x = sumOfSquares (x - 1) + x * x
