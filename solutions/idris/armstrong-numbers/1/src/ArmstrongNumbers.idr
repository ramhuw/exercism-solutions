module ArmstrongNumbers
import Data.Nat
len : Integer -> Nat
len n = if n < 10 then 1 else 1 + len (div n 10)

compute : Integer -> Nat -> Integer
compute 0 _ = 0
compute n t = cast (power (cast $ mod n 10) t ) + compute (div n 10) t

export
isArmstrongNumber : Integer -> Bool
isArmstrongNumber number = number == compute number (len number)
