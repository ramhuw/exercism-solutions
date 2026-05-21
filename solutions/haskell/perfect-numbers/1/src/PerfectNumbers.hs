module PerfectNumbers (classify, Classification (..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify n =
  if n <= 0
    then Nothing
    else
      let ss = s n
       in if ss == n
            then Just Perfect
            else
              if ss < n
                then Just Deficient
                else Just Abundant

s :: Int -> Int
s n = sum $ filter (\x -> mod n x == 0) [1 .. (n - 1)]