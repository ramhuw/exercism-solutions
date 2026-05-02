module Bob (responseFor) where
import Data.Char

responseFor :: String -> String
responseFor xs = if null $ filter (\x -> not $ isSpace x) xs
                  then "Fine. Be that way!"
                  else if isQuestion xs
                        then if isYell xs
                              then "Calm down, I know what I'm doing!"
                              else "Sure."
                        else if isYell xs
                              then "Whoa, chill out!"
                              else "Whatever." 

isQuestion :: String -> Bool
isQuestion s = if null $ filter (\x -> not $ isSpace x) s
                then False
                else if last (filter (\x -> not $ isSpace x) s) == '?'
                      then True
                      else False

isYell :: String -> Bool
isYell s = any (\x -> isLetter x) s && (all (\x -> isUpper x) $ filter (\x -> isLetter x) s)


