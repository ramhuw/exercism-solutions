"Your optional docstring here"
function distance(a, b)
    if length(a) != length(b)
        throw(ArgumentError(""))
    end
    count(((x, y),) -> x != y, zip(a, b))
end
