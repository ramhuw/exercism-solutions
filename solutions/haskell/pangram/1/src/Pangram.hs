module Pangram (isPangram) where
import Data.Char (toLower, isLetter)
import Data.List (sort, group)
isPangram :: String -> Bool
isPangram text = all (`elem` (map toLower text)) ['a'..'z']
