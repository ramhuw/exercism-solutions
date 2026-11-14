module Bob
import Data.List
import Data.String

lst : List a -> Maybe a
lst [] = Nothing
lst [x] = Just x
lst (x::xs) = lst xs

export
response : String -> String
response q =
    let trimmed = trim q
        unpacked = unpack trimmed
        isQuestion = unpacked /= [] && lst unpacked == Just '?'
        letters = unpacked |> filter isAlpha
        isYell = (letters |> all isUpper) && (length letters > 0)
    in
    if length trimmed == 0  then
        "Fine. Be that way!"
    else
    if isQuestion && isYell then
        "Calm down, I know what I'm doing!"
    else
    if isQuestion then
        "Sure."
    else
    if isYell then
        "Whoa, chill out!"
    else
        "Whatever."
