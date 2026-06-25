let is_equilateral a b c =
    a > 0 && a = b && b = c

let is_isosceles a b c =
    (a = b && a + b > c || a = c && a + c > b || b = c && b + c > a) && a > 0 && b > 0 && c > 0

let is_scalene a b c =
    a > 0 && b > 0 && c > 0 && not (is_isosceles a b c) && a + b > c && a + c > b && b + c > a