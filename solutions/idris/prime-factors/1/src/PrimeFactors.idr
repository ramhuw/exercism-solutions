module PrimeFactors

factorSearch : Int -> Int -> Int 
factorSearch n p = if p * p > n then n else
                    if n `mod` p == 0 then p 
                    else factorSearch n (p + 1)

export
factors : Int -> List Int
factors 1 = []
factors n = let p = factorSearch n 2 in
            p :: factors (n `div` p)
