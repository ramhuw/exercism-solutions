function square_root(n)
    if n <= 0
        throw(DomainError(n))
    end
    left = 1
    right = n
    while left < right
        middle = (left + right + 1) ÷ 2
        
        if n ÷ middle >= middle
            left = middle
        else
            right = middle - 1
        end
    end
    left
end
