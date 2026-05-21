module CryptoSquare (encode) where

import Data.Char

encode :: String -> String
encode [] = []
encode xs =
  let format = map toLower $ filter (\c -> c /= ' ' && not (isPunctuation c)) xs
      n = length format
      c = getc n
      r = getr n c
      s = app format (r * c)
      ss = split s c
      cc = code ss
   in unwords cc

getc :: Int -> Int
getc n = head $ filter (\c -> c * c >= n || c * (c - 1) >= n) [1 ..]

getr :: Int -> Int -> Int
getr n c
  | c * (c - 1) >= n = c - 1
  | otherwise = c

app :: String -> Int -> String
app s n
  | length s == n = s
  | otherwise = app (s ++ " ") n

split :: String -> Int -> [String]
split s c
  | null s = []
  | otherwise = take c s : split (drop c s) c

code :: [String] -> [String]
code ss =
  let r = length ss
      c = length $ head ss
   in [[ss !! i !! j | i <- [0 .. (r - 1)]] | j <- [0 .. (c - 1)]]