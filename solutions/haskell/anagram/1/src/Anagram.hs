module Anagram (anagramsFor) where

import Data.Char
import Data.List (sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter (\b -> isAnagram xs b) xss

isAnagram :: String -> String -> Bool
isAnagram a b = (map toLower a) /= (map toLower b) && (sort (map toLower a) == sort (map toLower b))