module Raindrops (convert) where

convert :: Int -> String
convert n =
  if n `mod` 3 /= 0 && n `mod` 5 /= 0 && n `mod` 7 /= 0
    then
      show n
    else
      let a =
            if mod n 3 == 0
              then
                "Pling"
              else
                ""
          b =
            if n `mod` 5 == 0
              then
                "Plang"
              else
                ""
          c =
            if n `mod` 7 == 0
              then
                "Plong"
              else
                ""
       in a ++ b ++ c