module ReverseString

revListAux : List a -> List a -> List a
revListAux [] r = r
revListAux (x::xs) r = revListAux xs (x::r)

revList : List a -> List a
revList l = revListAux l []

export
rev : String -> String
rev s = 
    pack $ revList $ unpack s
