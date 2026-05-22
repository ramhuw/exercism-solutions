module Triplet (tripletsWithSum) where

tripletsWithSum :: Int -> [(Int, Int, Int)]
tripletsWithSum sum = [(a, b, sum - a - b) | a <- [1 .. sum], b <- [(a + 1) .. sum], b < sum - a - b, a ^ 2 + b ^ 2 == (sum - a - b) ^ 2]
