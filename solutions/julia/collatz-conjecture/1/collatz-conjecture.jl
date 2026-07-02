function collatz_steps(n)
    if n <= 0
        throw(DomainError(n))
    elseif n == 1
        return 0
    elseif n % 2 == 0
        return 1 + collatz_steps(n/2)
    else
        return 1 + collatz_steps(3*n+1)
    end 
end
