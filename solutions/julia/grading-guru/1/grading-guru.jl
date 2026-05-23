function demote(n)
    if n isa Float64
        return ceil(UInt8, n)
    elseif n isa Integer
        return convert(Int8, n)
    else
        throw(MethodError(demote, n))
    end
end

function preprocess(coll)
    if coll isa Vector
        return reverse([demote(c) for c in coll])

    elseif coll isa Set
        return sort([demote(c) for c in coll], rev=true)
    else
        throw(MethodError(preprocess, coll))
    end
end

