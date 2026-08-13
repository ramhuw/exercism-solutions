"""
    count_nucleotides(strand)

The count of each nucleotide within `strand` as a dictionary.

Invalid strands raise a `DomainError`.

"""
function count_nucleotides(strand)
    d = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
    for c in strand
        if c == 'A' || c == 'C' || c == 'G' || c == 'T'
            d[c] = get(d, c, 0) + 1
        else
            throw(DomainError(c))
        end
    end
    d
end
