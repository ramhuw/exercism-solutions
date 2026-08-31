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
      let m = div (l + r + 1) 2
       in if arr ! m <= x
            then
              f arr x m r
            else
              f arr x l (m - 1)

find :: (Ord a) => Array Int a -> a -> Maybe Int
find array x =
  if null array
    then
      Nothing
    else
      let left = 0
          right = length array - 1
       in f array x left right
