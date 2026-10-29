module Raindrops

export
convert : Int -> String
convert number =
    let a = mod number 3 == 0
        b = mod number 5 == 0
        c = mod number 7 == 0
    in  if not (a || b || c) then
            show number
        else
            let x = if a then "Pling" else ""
                y = if b then "Plang" else ""
                z = if c then "Plong" else ""
            in  x ++ y ++ z
