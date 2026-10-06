module Grains

export
grains : Integer -> Maybe Integer
grains square = if square <= 0 || square > 64 then Nothing else 
                    if square == 1 then Just 1 else
                    grains (square - 1) >>= (\x => Just (2 * x))

export
totalGrains : Integer
totalGrains = 18446744073709551615
