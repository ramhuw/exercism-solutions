module ListOps
  ( length,
    reverse,
    map,
    filter,
    foldr,
    foldl',
    (++),
    concat,
  )
where

import Prelude hiding
  ( concat,
    filter,
    foldr,
    length,
    map,
    reverse,
    (++),
  )

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' f z xs = if null xs then z else let z' = f z (head xs) in seq z' (foldl' f z' (tail xs))

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f z xs = if null xs then z else f (head xs) (foldr f z (tail xs))

length :: [a] -> Int
length xs = if null xs then 0 else 1 + length (tail xs)

reverse :: [a] -> [a]
reverse xs = if null xs then [] else (last xs) : reverse (init xs)

map :: (a -> b) -> [a] -> [b]
map f xs = if null xs then [] else f (head xs) : map f (tail xs)

filter :: (a -> Bool) -> [a] -> [a]
filter p xs =
  if null xs
    then []
    else
      if p $ head xs then (head xs) : filter p (tail xs) else filter p $ tail xs

(++) :: [a] -> [a] -> [a]
xs ++ ys = if null xs then ys else head xs : (tail xs ++ ys)

concat :: [[a]] -> [a]
concat xss = if null xss then [] else head xss ++ concat (tail xss)
