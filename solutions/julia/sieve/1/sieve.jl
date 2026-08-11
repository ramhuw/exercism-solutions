function sieve(limit)
    s = [true for _ in 1:limit]
    s[1] = false
    for i in 2:limit
        if s[i]
            j = 2 * i
            while j <= limit
                s[j] = false
                j += i
            end
        end
    end
    [i for (i, j) in zip(1:limit, s) if j]
end
