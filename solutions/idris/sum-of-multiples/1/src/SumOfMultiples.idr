module SumOfMultiples

dvd : List Int -> Int -> Int
dvd [] n = 0
dvd (x::xs) n =
    if x /= 0 && mod n x == 0 then
        n
    else
        dvd xs n

export
sum : List Int -> Int -> Int
sum factors n =
    if n <= 0 then
        0
    else
        (sum factors (n - 1)) + (dvd factors (n - 1))
