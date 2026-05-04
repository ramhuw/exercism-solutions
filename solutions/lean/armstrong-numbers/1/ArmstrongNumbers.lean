namespace ArmstrongNumbers

def len (n : Nat) : Nat :=
  if n < 10
    then 1
    else 1 + len (n / 10)

partial def sumpow (d : Nat) (p : Nat) :=
  if d == 0
    then 0
    else (d % 10)^p + sumpow (d / 10) p

def isArmstrongNumber (number : Nat) : Bool :=
  number == sumpow number (len number)

end ArmstrongNumbers
