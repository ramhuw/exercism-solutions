module RnaTranscription

import Data.Vect

%default total

namespace DnaNucleotide
  public export
  data DnaNucleotide = G | C | T | A

namespace RnaNucleotide
  public export
  data RnaNucleotide = C | G | A | U

export
implementation Eq RnaNucleotide where
  (==) C C = True
  (==) G G = True
  (==) A A = True
  (==) U U = True
  (==) _ _ = False

export
implementation Show RnaNucleotide where
  show C = "C"
  show G = "G"
  show A = "A"
  show U = "U"

toSingleRna : DnaNucleotide -> RnaNucleotide
toSingleRna G = C
toSingleRna C = G
toSingleRna T = A
toSingleRna A = U

export
toRna : Vect n DnaNucleotide -> Vect n RnaNucleotide
toRna Nil = Nil
toRna (x::xs) = (toSingleRna x)::(toRna xs)