function isperfect(n)
    factorsum(n) == n
end

function isabundant(n)
    factorsum(n) > n
end

function isdeficient(n)
    factorsum(n) < n
end

function factorsum(n)
    if n < 1
        throw(DomainError(n))
    end
    ans = 0
    for i in 1:(n-1)
        if n % i == 0
            ans += i
        end
    end
    ans
end
