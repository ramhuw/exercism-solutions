module FlowerField (annotate) where
import Data.Char (intToDigit)

annotate :: [String] -> [String]
annotate field = 
    let m = length field
        n = length $ head field
    in [
        [
            if field !! i !! j == '*' 
                then '*' 
                else
                    let a = if i > 0 && field !! (i - 1) !! j == '*' then 1 else 0
                        b = if j > 0 && field !! i !! (j - 1) == '*' then 1 else 0
                        c = if i < m - 1 && field !! (i + 1) !! j == '*' then 1 else 0
                        d = if j < n - 1 && field !! i !! (j + 1) == '*' then 1 else 0
                        e = if i > 0 && j > 0 && field !! (i - 1) !! (j - 1) == '*' then 1 else 0
                        f = if i > 0 && j < n - 1 && field !! (i - 1) !! (j + 1) == '*' then 1 else 0
                        g = if i < m - 1 && j > 0 && field !! (i + 1) !! (j - 1) == '*' then 1 else 0
                        h = if i < m - 1 && j < n - 1 && field !! (i + 1) !! (j + 1) == '*' then 1 else 0
                        s = a + b + c + d + e + f + g + h
                    in if s == 0 then ' ' else intToDigit s
                        | j <- [0..n-1]
         ] 
                        | i <- [0..m-1]
    ]