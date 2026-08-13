function to_rna(dna)
    join(map(t, dna))
end

function t(c::Char)
    if c == 'G'
        'C'
    elseif c == 'C'
        'G'
    elseif c == 'T'
        'A'
    elseif c == 'A'
        'U'
    else
        throw(ErrorException(""))
    end
end

