module BinarySearch (find) where

import Data.Array

f :: (Ord a) => Array Int a -> a -> Int -> Int -> Maybe Int
f arr x l r =
  if l == r
    then
      if arr ! l == x
        then
          Just l
        else
          Nothing
    else
      let m = fromIntegral ((toInteger l + toInteger r + 1) `div` 2)
       in if arr ! m <= x
            then
              f arr x m r
            else
              f arr x l (m - 1)

find :: (Ord a) => Array Int a -> a -> Maybe Int
find arr x =
  let (left, right) = bounds arr
   in if left > right
        then
          Nothing
        else
          f arr x left right
