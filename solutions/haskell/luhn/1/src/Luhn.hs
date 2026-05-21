module Luhn (isValid) where

import Data.Char

isValid :: String -> Bool
isValid n =
  let ns = ls n
   in if length ns < 2
        then False
        else mod (s ns) 10 == 0

s :: [Int] -> Int
s ns
  | length ns == 0 = 0
  | length ns == 1 = head ns
  | otherwise = (last ns) + (db (ns !! (length ns - 2))) + (s (take (length ns - 2) ns))

ls :: String -> [Int]
ls s = map ((read :: String -> Int) . (\c -> [c])) $ filter isDigit s

db :: Int -> Int
db x =
  let y = 2 * x
   in if y > 9
        then y - 9
        else y
