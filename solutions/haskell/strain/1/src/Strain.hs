module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard p xs = if null xs
                then xs
                else if p (head xs)
                      then discard p (tail xs)
                      else (head xs) : discard p (tail xs)

keep :: (a -> Bool) -> [a] -> [a]
keep p xs = discard (\x -> not (p x)) xs
