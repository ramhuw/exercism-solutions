function prime(num)
    if num == 0
        throw(ErrorException("No such prime!"))
    end
    primes = []
    p = 2
    while length(primes) < num
        while any(q -> p % q == 0, primes)
            p += 1
        end
        push!(primes, p)
        p += 1
    end
    p - 1
end
