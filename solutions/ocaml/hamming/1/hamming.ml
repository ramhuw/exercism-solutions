type nucleotide = A | C | G | T
let (let*) = Result.bind
let rec hamming_distance (x : nucleotide list) (y : nucleotide list) : (Base.Int.t, Base.String.t) result = if List.length x <> List.length y then Error "strands must be of equal length" else if List.length x = 0 then Ok 0 else let* pa = hamming_distance (List.tl x) (List.tl y) in if List.hd x = List.hd y then Ok pa else Ok (pa + 1)
  
