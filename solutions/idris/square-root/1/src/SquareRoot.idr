module SquareRoot

squareRootSearch : Int -> Int -> Int -> Int
squareRootSearch radicand left right = 
    if left == right then left else
    let middle = (left + right + 1) `div` 2 in
    if middle <= radicand `div` middle then
        squareRootSearch radicand middle right
    else
        squareRootSearch radicand left (right - 1)

export
squareRoot : Int -> Int
squareRoot radicand = squareRootSearch radicand 0 radicand
