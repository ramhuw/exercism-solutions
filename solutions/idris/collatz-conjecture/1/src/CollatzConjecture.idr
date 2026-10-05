module CollatzConjecture

export
steps : Int -> Maybe Int
steps number = 
    if number <= 0 then
        Nothing
    else
        if number == 1 then
            Just 0
        else 
            if mod number 2 == 0 then
                steps (div number 2) >>= \x => Just (1 + x)
            else
                steps (number * 3 + 1) >>= \x => Just (1 + x)
