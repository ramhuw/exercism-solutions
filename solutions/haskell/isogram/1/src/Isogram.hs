module Isogram (isIsogram) where

import Data.Char
import Data.List

isIsogram :: String -> Bool
isIsogram s = all (\l -> length l == 1) $ group $ sort $ map toLower $ filter (\c -> c /= ' ' && c /= '-' && c /= '_') s
