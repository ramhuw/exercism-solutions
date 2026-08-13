# Define a custom type Fiberator
struct Fiberator
    n::Int
end

# Implement `iterate` method(s)
function Base.iterate(iter::Fiberator)
    if iter.n <= 0
        return nothing
    else
        return (1, (1, 1, 2))
    end
end
function Base.iterate(iter::Fiberator, state)
    if state[3] > iter.n
        return nothing
    else
        return (state[2], (state[2], state[1] + state[2], state[3] + 1))
    end
end

# Make `collect` work
function Base.length(iter::Fiberator)
    iter.n
end

# Enable Julia to infer element type
function Base.eltype(iter::Fiberator)
    Int
end
