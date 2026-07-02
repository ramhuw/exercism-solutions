function prime_factors(n)
    ans = []
    prime = 2
    let worker = n
        while worker != 1
            while worker % prime == 0
                worker /= prime
                push!(ans, prime)
            end
            prime += 1
        end
    end
    ans
end
