module ComplexNumbers
  ( Complex,
    conjugate,
    abs,
    exp,
    real,
    imaginary,
    mul,
    add,
    sub,
    div,
    complex,
  )
where

import Prelude hiding (abs, div, exp)

-- Data definition -------------------------------------------------------------
data Complex a = Complex a a deriving (Eq, Show)

complex :: (a, a) -> Complex a
complex (x, y) = Complex x y

-- unary operators -------------------------------------------------------------
conjugate :: (Num a) => Complex a -> Complex a
conjugate (Complex x y) = Complex x (-y)

abs :: (Floating a) => Complex a -> a
abs (Complex x y) = sqrt (x * x + y * y)

real :: (Num a) => Complex a -> a
real (Complex x y) = x

imaginary :: (Num a) => Complex a -> a
imaginary (Complex x y) = y

exp :: (Floating a) => Complex a -> Complex a
exp (Complex x y) = Complex (2.718 ** x * (cos y)) (2.718 ** x * (sin y))

-- binary operators ------------------------------------------------------------
mul :: (Num a) => Complex a -> Complex a -> Complex a
mul (Complex x y) (Complex z w) = Complex (x * z - y * w) (x * w + y * z)

add :: (Num a) => Complex a -> Complex a -> Complex a
add (Complex x y) (Complex z w) = Complex (x + z) (y + w)

sub :: (Num a) => Complex a -> Complex a -> Complex a
sub (Complex x y) (Complex z w) = Complex (x - z) (y - w)

div :: (Fractional a) => Complex a -> Complex a -> Complex a
div (Complex x y) (Complex z w) = Complex ((x * z + y * w) / (z * z + w * w)) ((y * z - x * w) / (z * z + w * w))
