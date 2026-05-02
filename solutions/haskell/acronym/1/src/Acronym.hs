module Acronym (abbreviate) where
import Data.Char (toUpper, isUpper, isLower, isSpace)
split :: Char -> Bool
split ' ' = True
split '_' = True
split '-' = True
split a = False


splitWhen :: String -> [String]
splitWhen [] = [[]]
splitWhen (x : xs) = if null xs
                      then if split x
                            then []
                            else [[x]]
                      else 
                        let h = head xs
                            t = tail xs
                        in
                          if (isLower x) && (isUpper h)
                            then [x] : ((h : head (splitWhen t)) : (tail $ splitWhen t))
                            else if split x
                                  then [] : (splitWhen xs)
                                  else (x : head (splitWhen xs)) : (tail $ splitWhen xs)

abbreviate :: String -> String
abbreviate xs = map (toUpper.head) $ filter (\x -> not (null x)) $ splitWhen xs
