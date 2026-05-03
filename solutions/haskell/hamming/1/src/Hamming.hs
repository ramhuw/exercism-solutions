module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys =
  if length xs /= length ys
    then Nothing
    else
      if null xs
        then Just 0
        else
          if last xs == last ys
            then distance (init xs) (init ys)
            else distance (init xs) (init ys) >>= (\x -> Just (x + 1))
