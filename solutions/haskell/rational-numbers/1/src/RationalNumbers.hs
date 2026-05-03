module RationalNumbers
  ( Rational,
    abs,
    numerator,
    denominator,
    add,
    sub,
    mul,
    div,
    pow,
    expRational,
    expReal,
    rational,
  )
where

import GHC.TypeLits (Nat)
import Prelude hiding (Rational, abs, div)

-- Data definition -------------------------------------------------------------
data Rational a = Rational a a deriving (Eq, Show)

rational :: (Integral a) => (a, a) -> Rational a
rational (m, n) =
  if n < 0
    then rational (-m, -n)
    else Rational (quot m (gcd m n)) (quot n (gcd m n))

-- unary operators -------------------------------------------------------------
abs :: (Integral a) => Rational a -> Rational a
abs (Rational m n) =
  if m < 0
    then Rational (-m) n
    else Rational m n

numerator :: (Integral a) => Rational a -> a
numerator (Rational m n) = m

denominator :: (Integral a) => Rational a -> a
denominator (Rational m n) = n

-- binary operators ------------------------------------------------------------
add :: (Integral a) => Rational a -> Rational a -> Rational a
add (Rational m n) (Rational o p) = rational ((m * p + n * o), (n * p))

sub :: (Integral a) => Rational a -> Rational a -> Rational a
sub (Rational m n) (Rational o p) = rational ((m * p - n * o), (n * p))

mul :: (Integral a) => Rational a -> Rational a -> Rational a
mul (Rational m n) (Rational o p) = rational (m * o, n * p)

div :: (Integral a) => Rational a -> Rational a -> Rational a
div (Rational m n) (Rational o p) = rational (m * p, n * o)

pow :: (Integral a) => Rational a -> a -> Rational a
pow (Rational m n) p =
  if p >= 0
    then rational (m ^ p, n ^ p)
    else rational (n ^ (-p), m ^ (-p))

expRational :: (Integral a) => (Floating b) => Rational a -> b -> b
expRational (Rational m n) x = (fromIntegral m) ** x / (fromIntegral n) ** x

expReal :: (Floating a) => (Integral b) => a -> Rational b -> a
expReal x (Rational m n) = x ** ((fromIntegral m) / (fromIntegral n))