module Prime (nth) where

nth :: Int -> Maybe Integer
nth n
  | n <= 0 = Nothing
  | otherwise = Just $ primes !! (n - 1)

sieve :: [Integer] -> [Integer]
sieve [] = []
sieve (n : ns) = n : sieve (filter (\x -> mod x n /= 0) ns)

primes = sieve [2 ..]
