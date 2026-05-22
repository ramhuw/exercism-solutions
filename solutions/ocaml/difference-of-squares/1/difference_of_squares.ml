let sum (arr : int list) : int = List.fold_left (fun acc a -> acc + a) 0 arr

let square_of_sum n = 
    (sum (List.init n (fun i -> i + 1))) * (sum (List.init n (fun i -> i + 1)))

let sum_of_squares (n : int) = sum (List.map (fun x -> x*x) (List.init n (fun i -> i + 1)))
    

let difference_of_squares n =
    square_of_sum n - sum_of_squares n
