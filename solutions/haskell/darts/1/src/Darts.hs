module Darts (score) where

score :: Float -> Float -> Int
score x y
  | rs <= 1.0 = 10
  | rs <= 25.0 = 5
  | rs <= 100.0 = 1
  | otherwise = 0
  where 
    rs = x^2 + y^2

