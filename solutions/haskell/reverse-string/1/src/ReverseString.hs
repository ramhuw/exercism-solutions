module ReverseString (reverseString) where

reverseString :: String -> String
reverseString str = if null str
                      then str
                      else  (last str) : reverseString (init str)
