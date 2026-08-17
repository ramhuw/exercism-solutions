function sum_of_multiples(limit, factors)
    b = [false for _ in 1:(limit-1)]
    for f in factors
        g = f
        while f != 0 && g < limit
            b[g] = true
            g += f
        end
    end
    sum([i for i in 1:(limit-1) if b[i]])
end
