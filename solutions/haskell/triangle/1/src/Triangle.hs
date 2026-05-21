module Triangle (TriangleType (..), triangleType) where

import Data.List

data TriangleType
  = Equilateral
  | Isosceles
  | Scalene
  | Illegal
  deriving (Eq, Show)

triangleType :: (Num a, Ord a) => a -> a -> a -> TriangleType
triangleType a b c =
  let [x, y, z] = sort [a, b, c]
   in if x + y < z || x <= 0
        then Illegal
        else
          if x == y && y == z
            then Equilateral
            else
              if x == y || y == z
                then Isosceles
                else Scalene
