module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n = if n < 1
            then Nothing
            else if n == 1
                  then Just 0
                  else (collatz m) >>= (\x -> Just (x + 1))
                    where 
                    m = if even n
                          then div n 2
                          else 3 * n + 1
