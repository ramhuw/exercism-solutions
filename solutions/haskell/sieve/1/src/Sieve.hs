module Sieve (primesUpTo) where

-- You should not use any of the division operations when implementing
-- the sieve of Eratosthenes.

import Data.List
import Prelude hiding (div, divMod, mod, quot, quotRem, rem, (/))

primesUpTo :: Integer -> [Integer]
primesUpTo n = if n < 2 then [] else sieve [2 ..] n

sieve :: [Integer] -> Integer -> [Integer]
sieve [] n = []
sieve (x : xs) n = if x > n then [] else x : sieve (xs \\ takeWhile (<= n) (map (* x) [1 ..])) n