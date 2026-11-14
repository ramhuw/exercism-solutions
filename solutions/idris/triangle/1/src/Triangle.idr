module Triangle

import Data.Vect

isTriangle : Vect 3 Integer -> Bool
isTriangle (x :: y :: z :: Nil) = x + y > z && x + z > y && y + z > x && x > 0 && y > 0 && z > 0

export
isEquilateral : Vect 3 Integer -> Bool
isEquilateral (x :: y :: z :: Nil)  = x == y && y == z && x /= 0

export
isIsosceles : Vect 3 Integer -> Bool
isIsosceles (x :: y :: z :: Nil) = isTriangle (x :: y :: z :: Nil) && (x == y && x /= 0 || x == z && x /= 0 || y == z && z /= 0)

export
isScalene : Vect 3 Integer -> Bool
isScalene (x :: y :: z :: Nil) = x + y > z && x + z > y && y + z > x && x > 0 && y > 0 && z > 0 && x /= y && x /= z && y /= z
