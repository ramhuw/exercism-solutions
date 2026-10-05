module ListOps



export
append : List a -> List a -> List a
append [] list2 = list2
append (x::xs) list2 = x::(append xs list2)

export
concat : List (List a) -> List a
concat [] = []
concat (x::xs) = append x (concat xs)

export
filter : (a -> Bool) -> List a -> List a
filter predicate [] = []
filter predicate (x::xs) = if predicate x then 
                               x::(ListOps.filter predicate xs)
                           else
                                ListOps.filter predicate xs


export
length : List a -> Nat
length [] = 0
length (x::xs) = 1 + ListOps.length xs

export
map : (a -> b) -> List a -> List b
map function [] = []
map function (x::xs) = (function x) :: (map function xs)

export
foldl : (a -> e -> a) -> a -> List e -> a
foldl function initial [] = initial
foldl function initial (x::xs) = ListOps.foldl function (function initial x) xs

export
foldr : (a -> e -> a) -> a -> List e -> a
foldr function initial list = ListOps.foldl function initial (reverse list)
export
reverse : List a -> List a
reverse [] = []
reverse (x::xs) = append (ListOps.reverse xs) [x]
