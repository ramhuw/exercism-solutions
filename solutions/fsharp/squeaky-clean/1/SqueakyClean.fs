module SqueakyClean

open System

let transform (c: char) : string =
    match c with
    | '-' -> "_"
    | ch when Char.IsWhiteSpace ch -> ""
    | ch when Char.IsUpper ch -> "-" + (Char.ToLower ch).ToString()
    | ch when Char.IsDigit ch -> ""
    | ch when 'α' <= ch && ch <= 'ω' -> "?"
    | _ -> c.ToString()

let clean (identifier: string) : string = String.collect transform identifier
