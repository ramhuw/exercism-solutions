//Solution goes in Sources
import Foundation

struct ComplexNumbers {
    var real: Double
    var imaginary: Double

    init (realComponent: Double?, imaginaryComponent: Double?) {
        self.real = realComponent ?? 0
        self.imaginary = imaginaryComponent ?? 0
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.sub(complexNumber: rhs).absolute() < 0.00001
    }

    func add(complexNumber: Self) -> Self {
        return ComplexNumbers(realComponent: self.real + complexNumber.real, imaginaryComponent: self.imaginary + complexNumber.imaginary)
    }

    func sub (complexNumber: Self) -> Self {
        return ComplexNumbers(realComponent: self.real - complexNumber.real, imaginaryComponent: self.imaginary - complexNumber.imaginary)
    }

    func mul(complexNumber: Self) -> Self {
        let a = self.real
        let b = self.imaginary
        let c = complexNumber.real
        let d = complexNumber.imaginary
        return ComplexNumbers(realComponent: a*c-b*d, imaginaryComponent: a*d+b*c)
    }

    func div(complexNumber: Self) -> Self {
        let a = self.real
        let b = self.imaginary
        let c = complexNumber.real
        let d = complexNumber.imaginary
        return ComplexNumbers(realComponent: (a*c+b*d)/(c*c+d*d), imaginaryComponent: (b*c-a*d)/(c*c+d*d))
    }

    func absolute() -> Double {
        sqrt(self.real*self.real+self.imaginary*self.imaginary)
    }

    func conjugate() -> Self {
        ComplexNumbers(realComponent: self.real, imaginaryComponent: -self.imaginary)
    }

    func exponent() -> Self {
        let r = exp(self.real)
        let theta = self.imaginary
        return ComplexNumbers(realComponent: r*cos(theta), imaginaryComponent: r*sin(theta))
    }
}