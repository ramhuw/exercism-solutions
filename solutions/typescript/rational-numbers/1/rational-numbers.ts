export class Rational {
  private n: number;
  private d: number
  constructor(n: number, d: number) {
    const g = gcd(n, d);
    this.n = d*g >= 0 ? n/g : -n/g;
    this.d = d*g >= 0 ? d/g : -d/g;
  }

  get numerator(): number {
    return this.n
  }

  get denominator(): number {
    return this.d
  }

  add(other: Rational): Rational {
    return new Rational(this.n*other.d+this.d*other.n, this.d*other.d)
  }

  sub(other: Rational): Rational {
    return new Rational(this.n*other.d-this.d*other.n, this.d*other.d)
  }

  mul(other: Rational): Rational {
    return new Rational(this.n*other.n, this.d*other.d)
  }

  div(other: Rational): Rational {
    if (other.n === 0) {
      return new Rational(0, 1)
    }
    return new Rational(this.n*other.d, this.d*other.n)
  }

  abs(other: Rational): Rational {
    return new Rational(Math.abs(this.n), Math.abs(this.d))
  }

  exprational(x: number) {
    return x >= 0 ? new Rational(this.n**x, this.d**x) : new Rational(this.d**(-x), this.n**(-x))
  }

  expreal(x: number) {
    return x**(this.n/this.d)
  }

  reduce(): Rational {
    return this
  }
}

function gcd(a: number, b: number): number {
  if (Math.abs(a) < Math.abs(b)) {
    return gcd(b, a)
  }
  if (b === 0) {
    return a
  }
  return gcd(b, a%b)
}
