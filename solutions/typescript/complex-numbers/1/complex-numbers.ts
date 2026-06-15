export class ComplexNumber {
  public _real: number;
  public _imag: number;
  constructor(real: number, imaginary: number) {
    this._real = real;
    this._imag = imaginary;
  }

  public get real(): number {
    return this._real
  }

  public get imag(): number {
    return this._imag
  }

  public add(other: ComplexNumber): ComplexNumber {
    return new ComplexNumber(
      this._real + other._real,
      this._imag + other._imag
    )
  }

  public sub(other: ComplexNumber): ComplexNumber {
    return new ComplexNumber(
      this._real - other._real,
      this._imag - other._imag
    )
  }

  public div(other: ComplexNumber): ComplexNumber {
    let a = this._real;
    let b = this._imag;
    let c = other._real;
    let d = other._imag;
    return new ComplexNumber((a*c+b*d)/(c**2+d**2), (b*c-a*d)/(c**2+d**2))
  }

  public mul(other: ComplexNumber): ComplexNumber {
    let a = this._real;
    let b = this._imag;
    let c = other._real;
    let d = other._imag;
    return new ComplexNumber(a*c-b*d, b*c+a*d)
  }

  public get abs(): number {
    return Math.sqrt(this.real**2+this.imag**2)
  }

  public get conj(): ComplexNumber {
    const a = this._real
    const b = this._imag === 0 ? 0 : this._imag * (-1)
    return new ComplexNumber(a, b)
  }

  public get exp(): ComplexNumber {
    let r = Math.exp(this._real)
    return new ComplexNumber(r * Math.cos(this._imag), r * Math.sin(this._imag))
  }
}
