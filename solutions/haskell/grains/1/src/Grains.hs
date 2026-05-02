module Grains (square, total) where

square :: Integer -> Maybe Integer
square n = if n < 1 || n > 64
            then Nothing
            else 
              if n == 1
              then Just 1
              else (square (n - 1)) >>= (\x -> Just (2*x))
p :: Maybe Integer -> Integer
p n = case n of
        Nothing -> 0
        Just m -> m
total :: Integer
total = sum $ map (p.square) [1..64] 
