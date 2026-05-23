namespace ComplexNumbers

structure ComplexNumber where
  real : Float
  imag : Float
  deriving Repr

/- define how a complex number should be constructed out of a literal number -/
instance {n : Nat} : OfNat ComplexNumber n where
  ofNat :=
    {real := Float.ofInt n, imag := 0.0}

def real (z : ComplexNumber) : Float :=
  z.real

def imaginary (z : ComplexNumber) : Float :=
  z.imag

def mul (z1 : ComplexNumber) (z2 : ComplexNumber) : ComplexNumber :=
  let x1 := z1.real
  let x2 := z2.real
  let y1 := z1.imag
  let y2 := z2.imag
  {
    real := x1 * x2 - y1 * y2,
    imag := x1 * y2 + y1 * x2
  }

def conjugate (z : ComplexNumber) : ComplexNumber :=
  let x := z.real
  let y := z.imag
  {
    real := x,
    imag := -y
  }


def div (z1 : ComplexNumber) (z2 : ComplexNumber) : ComplexNumber :=
  let x2 := z2.real
  let y2 := z2.imag
  let d := x2^2 + y2^2
  let z2b := conjugate z2
  let znum := mul z1 z2b
  {
    real := znum.real / d,
    imag := znum.imag / d
  }

def sub (z1 : ComplexNumber) (z2 : ComplexNumber) : ComplexNumber :=
  let x1 := z1.real
  let x2 := z2.real
  let y1 := z1.imag
  let y2 := z2.imag
  {
    real := x1 - x2,
    imag := y1 - y2
  }

def add (z1 : ComplexNumber) (z2 : ComplexNumber) : ComplexNumber :=
  let x1 := z1.real
  let x2 := z2.real
  let y1 := z1.imag
  let y2 := z2.imag
  {
    real := x1 + x2,
    imag := y1 + y2
  }

def abs (z : ComplexNumber) : Float :=
  let x := z.real
  let y := z.imag
  Float.sqrt (x^2 + y^2)

def exp (z : ComplexNumber) : ComplexNumber :=
  let x := z.real
  let y := z.imag
  let f := Float.exp x
  {
    real := f * Float.cos y
    imag := f * Float.sin y
  }

end ComplexNumbers
