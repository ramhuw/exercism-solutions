function triangle(n)
    if n < 0
        throw(DomainError(n))
    end
    ans = []
    for i in 1:n
        line = [1]
        for j in 2:(i-1)
            push!(line, ans[i-1][j-1] + ans[i-1][j])
        end
        if i > 1
            push!(line, 1)
        end
        push!(ans, line)
    end
    ans
end
