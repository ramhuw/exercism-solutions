module ArmstrongNumbers (armstrong) where

armstrong :: (Integral a) => a -> Bool
armstrong n =
  let ls = ntl n
   in n == sum (map (\x -> x ^ (length ls)) ls)

ntl :: (Integral a) => a -> [a]
ntl n
  | n < 10 = [n]
  | otherwise = (mod n 10) : ntl (div n 10)