module Minesweeper (annotate) where

annotate :: [String] -> [String]
annotate [] = []
annotate board =
  let m = length board
      n = length $ head board
   in [ [ if (board !! i) !! j == '*'
            then '*'
            else
              let l = if j > 0 && (board !! i) !! (j - 1) == '*' then 1 else 0
                  r = if j < n - 1 && (board !! i) !! (j + 1) == '*' then 1 else 0
                  u = if i > 0 && (board !! (i - 1)) !! j == '*' then 1 else 0
                  d = if i < m - 1 && (board !! (i + 1)) !! j == '*' then 1 else 0
                  lu = if i > 0 && j > 0 && (board !! (i - 1)) !! (j - 1) == '*' then 1 else 0
                  ru = if i > 0 && j < n - 1 && (board !! (i - 1)) !! (j + 1) == '*' then 1 else 0
                  ld = if i < m - 1 && j > 0 && (board !! (i + 1)) !! (j - 1) == '*' then 1 else 0
                  rd = if i < m - 1 && j < n - 1 && (board !! (i + 1)) !! (j + 1) == '*' then 1 else 0
                  s = l + r + u + d + lu + ru + ld + rd
               in if s == 0
                    then ' '
                    else head $ show s
          | j <- [0 .. (n - 1)]
        ]
        | i <- [0 .. (m - 1)]
      ]
