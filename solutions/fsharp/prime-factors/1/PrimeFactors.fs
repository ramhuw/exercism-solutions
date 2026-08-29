module PrimeFactors

let rec fs (n : int64) (p : int64) (r : int list) : int list =
    match n with
    | 1L -> r
    | _ -> 
        if n % p = 0 then 
            fs (n / p) p (List.append r [int p]) 
        else
            if n / p < p then 
                fs n n r 
            else 
                fs n (p + 1L) r

let factors number = fs number 2 []