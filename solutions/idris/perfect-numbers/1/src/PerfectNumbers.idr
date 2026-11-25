module PerfectNumbers

public export
data Category = Perfect | Abundant | Deficient

compute : Int -> Int -> Int -> Int
compute n d a =
    if d == n then
        a
    else
        if mod n d == 0 then
            compute n (d + 1) (a + d)
        else
            compute n (d + 1) a

export
classify : Int -> Maybe Category
classify number =
    if number <= 0 then
        Nothing
    else
        Just (let x = compute number 1 0 in
        if x == number then
            Perfect
        else
            if x < number then
                Deficient
            else
                Abundant)
