let rec to_roman n =
    match n with
    | _ when n >= 1000 -> "M" ^ to_roman (n - 1000)
    | _ when n >= 900 -> "CM" ^ to_roman (n - 900)
    | _ when n >= 500 -> "D" ^ to_roman (n - 500)
    | _ when n >= 400 -> "CD" ^ to_roman (n - 400)
    | _ when n >= 100 -> "C" ^ to_roman (n - 100) 
    | _ when n >= 90 -> "XC" ^ to_roman (n - 90)
    | _ when n>= 50 -> "L" ^ to_roman (n - 50)
    | _ when n >= 40 -> "XL" ^ to_roman (n - 40)
    | _ when n >= 10 -> "X" ^ to_roman (n - 10)
    | _ when n >= 9 -> "IX" ^ to_roman (n - 9)
    | _ when n >= 5 -> "V" ^ to_roman (n - 5)
    | _ when n >= 4 -> "IV" ^ to_roman (n - 4)
    | _ when n >= 1 -> "I" ^ to_roman (n - 1)
    | _ -> ""