import kotlin.math.sqrt
import kotlin.math.exp
import kotlin.math.sin
import kotlin.math.cos

data class ComplexNumber(val real: Double = 0.0, val imag: Double = 0.0) {

    operator fun plus(other: ComplexNumber): ComplexNumber =
        ComplexNumber(this.real + other.real, this.imag + other.imag)

    operator fun minus(other: ComplexNumber): ComplexNumber =
        ComplexNumber(this.real - other.real, this.imag - other.imag)

    operator fun times(other: ComplexNumber): ComplexNumber {
        val a = this.real
        val b = this.imag
        val c = other.real
        val d = other.imag
        return ComplexNumber(a * c - b * d, a * d + b * c)
    }
    
    operator fun times(other: Double): ComplexNumber = ComplexNumber(this.real * other, this.imag * other)

    operator fun div(other: Double): ComplexNumber {
        return ComplexNumber(this.real / other, this.imag / other)
    }

    operator fun div(other: ComplexNumber): ComplexNumber {return this * other.conjugate() / (other.abs * other.abs)
    }

    val abs: Double = sqrt(this.real * this.real + this.imag * this.imag)

    fun conjugate(): ComplexNumber = ComplexNumber(this.real, -this.imag)

    
}
fun exponential(z: ComplexNumber): ComplexNumber {
        val r = exp(z.real)
        return ComplexNumber(cos(z.imag), sin(z.imag)) * r
    }
