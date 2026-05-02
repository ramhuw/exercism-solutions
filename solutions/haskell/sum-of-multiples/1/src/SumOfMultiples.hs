module SumOfMultiples (sumOfMultiples) where
import Data.List

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ map head $ group $ sort $ concatMap (\base -> (m base limit)) factors

m :: Integer -> Integer -> [Integer]
m 0 limit = [0]
m base limit = [x * base | x <- [0..(div (limit - 1) base)]]
