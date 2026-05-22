module GameOfLife (tick) where

tick :: [[Int]] -> [[Int]]
tick [] = []
tick cells =
  let m = length cells
      n = length $ head cells
      count :: Int -> Int -> Int
      count i j = if i >= 0 && j >= 0 && i < m && j < n then (cells !! i) !! j else 0
   in [ [ let nbs = count (i - 1) j + count (i + 1) j + count (i - 1) (j - 1) + count (i + 1) (j - 1) + count (i - 1) (j + 1) + count (i + 1) (j + 1) + count i (j - 1) + count i (j + 1)
           in if (count i j == 1 && (nbs == 2 || nbs == 3)) || (count i j == 0 && nbs == 3) then 1 else 0
          | j <- [0 .. (n - 1)]
        ]
        | i <- [0 .. (m - 1)]
      ]