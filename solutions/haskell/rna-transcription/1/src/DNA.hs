module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA [] = Right []
toRNA (x : xs) = do
                  a <- t x
                  b <- toRNA xs
                  return (a : b)
                where 
                  t :: Char -> Either Char Char
                  t 'G' = Right 'C'
                  t 'C' = Right 'G'
                  t 'T' = Right 'A'
                  t 'A' = Right 'U'
                  t err = Left err
                