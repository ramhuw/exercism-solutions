let rec find_div (n : int64) (p : int64) : int64 = 
    if Int64.rem n p = 0L then p else find_div n (Int64.add p 1L)
let rec factors_of n = 
    if n = 1L then [] else
        let p = find_div n 2L in
        p :: factors_of (Int64.div n p)
