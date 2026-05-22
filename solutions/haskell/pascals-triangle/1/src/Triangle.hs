module Triangle (rows) where

rows :: Int -> [[Integer]]
rows n = take n infRows

infRows :: [[Integer]]
infRows = [[if j == 0 || j == i then 1 else infRows !! (i - 1) !! (j - 1) + infRows !! (i - 1) !! j | j <- [0 .. i]] | i <- [0 ..]]