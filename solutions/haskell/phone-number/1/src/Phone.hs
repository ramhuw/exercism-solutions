module Phone (number) where

import Data.Char

number :: String -> Maybe String
number xs = ft xs >>= rn >>= fn

ft :: String -> Maybe String
ft xs = Just $ filter isDigit xs

rn :: String -> Maybe String
rn xs
  | length xs == 10 = Just xs
  | length xs == 11 && head xs == '1' = Just $ tail xs
  | otherwise = Nothing

fn :: String -> Maybe String
fn xs =
  if elem (head xs) ['0', '1'] || elem (xs !! 3) ['0', '1']
    then Nothing
    else Just xs