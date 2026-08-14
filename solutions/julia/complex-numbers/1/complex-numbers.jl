# Uncomment the following line to enable bonus tests involving arithmetic between real numbers and complex numbers.
# enable_realcomplex_tests = true

# Uncomment the following line to enable bonus tests for syntax sugar.
# enable_syntaxsugar_tests = true

struct ComplexNumber{T <: Real, S<:Real} <: Number
    x::T
    y::S
end

function Base.:+(z::ComplexNumber, w::ComplexNumber)::ComplexNumber
    ComplexNumber(z.x+w.x, z.y+w.y)
end

function Base.:-(z::ComplexNumber, w::ComplexNumber)::ComplexNumber
    ComplexNumber(z.x-w.x, z.y-w.y)
end

function Base.:*(z::ComplexNumber, w::ComplexNumber)::ComplexNumber
    ComplexNumber(z.x*w.x-z.y*w.y, z.x*w.y+z.y*w.x)
end

function Base.:/(a::Real, w::ComplexNumber)::ComplexNumber
    d = w.x^2 + w.y^2
    ComplexNumber(a*w.x/d, -a*w.y/d)
end

function Base.:/(z::ComplexNumber, w::ComplexNumber)::ComplexNumber
    z * (1/w)
end

function Base.:/(z::ComplexNumber, a::Real)
    ComplexNumber(z.x/a, z.y/a)
end

function Base.exp(z::ComplexNumber)::ComplexNumber
    r = exp(z.x)
    ComplexNumber(r*cos(z.y), r*sin(z.y))
end

function Base.abs(z::ComplexNumber)
    sqrt(z.x^2+z.y^2)
end

function Base.conj(z::ComplexNumber)
    ComplexNumber(z.x, -z.y)
end

function Base.real(z::ComplexNumber)
    z.x
end

function Base.imag(z::ComplexNumber)
    z.y
end

function Base.isapprox(z::ComplexNumber, w::ComplexNumber; atol=1e-15)
    abs(z - w) < atol
end

function Base.:(==)(z::ComplexNumber, w::ComplexNumber)
    z.x==w.x&&z.y==w.y
end
