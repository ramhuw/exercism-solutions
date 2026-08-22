let rec f arr target left right = 
    if left >= right then 
        if arr.(left) = target then Ok left else Error "value not in array"
     else
        let middle = (left + right + 1) / 2 in
        if arr.(middle) = target then Ok middle else
            if arr.(middle) < target 
                then f arr target middle right
    else f arr target left (middle - 1)


let find arr target =
    if Array.length arr = 0 then Error "value not in array" else 
    f arr target 0 ((Array.length arr) - 1)

