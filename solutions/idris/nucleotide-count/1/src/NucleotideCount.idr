module NucleotideCount
import Prelude

public export
record DNA where
    constructor MkDNA
    adenine, cytosine, guanine, thymine : Nat

compute : List Char -> Nat -> Nat -> Nat -> Nat -> Maybe DNA
compute [] a c g t = Just $ MkDNA a c g t
compute ('A'::xs) a c g t = compute xs (a + 1) c g t
compute ('C'::xs) a c g t = compute xs a (c+1) g t
compute ('G'::xs) a c g t = compute xs a c (g+1) t
compute ('T'::xs) a c g t = compute xs a c g (t+1)
compute (_::_) a c g t = Nothing

export
nucleotideCounts : String -> Maybe DNA
nucleotideCounts strand = compute (unpack strand) 0 0 0 0
