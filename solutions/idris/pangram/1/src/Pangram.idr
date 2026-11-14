module Pangram
import Data.List
export
isPangram : String -> Bool
isPangram sentence = (sentence |> unpack |> map toUpper |> filter isAlpha |> nub |> length) == 26
