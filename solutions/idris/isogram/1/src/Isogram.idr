module Isogram
import Data.List
export
isIsogram : String -> Bool
isIsogram s = (x |> nub |> length) == length x
                where x = s |> unpack |> map toUpper |> filter isAlpha
