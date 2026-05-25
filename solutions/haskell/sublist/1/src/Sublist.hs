module Sublist (sublist) where

sublist :: (Eq a) => [a] -> [a] -> Maybe Ordering
sublist xs ys =
  if length xs == length ys
    then
      if lt xs ys then Just EQ else Nothing
    else
      if length xs < length ys
        then if lt xs ys then Just LT else Nothing
        else
          if lt ys xs then Just GT else Nothing

lt :: (Eq a) => [a] -> [a] -> Bool
lt xs ys =
  if length xs > length ys
    then False
    else elem xs [take (length xs) (drop i ys) | i <- [0 .. (length ys - length xs)]]
