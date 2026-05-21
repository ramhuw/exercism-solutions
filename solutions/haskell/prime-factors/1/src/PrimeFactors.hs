module PrimeFactors (primeFactors) where

import Data.List
import Data.Maybe

primeFactors :: Integer -> [Integer]
primeFactors 1 = []
primeFactors n =
  let p = fd n
   in p : primeFactors (div n p)

fd :: Integer -> Integer
fd n = fromJust $ find (\x -> mod n x == 0) [2 ..]
