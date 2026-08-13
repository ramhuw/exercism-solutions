
# Define an abstract type Pet

abstract type Pet end

# Define concrete types Dog and Cat

struct Dog <: Pet 
    name::String
end
struct Cat <: Pet 
    name::String
end

# Define a name() function

name(p::Pet) = p.name # Implement this

# Define multiple methods for meets(a, b)
# Only the first one is stubbed

meets(a::Dog, b::Dog) = "sniffs" # Implement this
meets(a::Cat, b::Dog) = "hisses"
meets(a::Cat, b::Cat) = "slinks"
meets(a::Dog, b::Cat) = "chases"
meets(a::Pet, b::Pet) = "is cautious"
meets(a::Pet, b) = "runs away"
meets(a, b) = "nothing happens"

# Implement the encounter(a, b) function

encounter(a, b) = "$(name(a)) meets $(name(b)) and $(meets(a, b))."

# Define three fallback methods for meets(a, b)
# Stubs are not provided for these, but look at the hints if necessary
