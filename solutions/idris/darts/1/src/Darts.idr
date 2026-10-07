module Darts

export
score : Double -> Double -> Int
score x y = 
    let r2 = x*x + y*y in
    if r2 > 100 then
        0
    else
        if r2 > 25 then
            1
        else
            if r2 > 1 then
                5
            else
                10
