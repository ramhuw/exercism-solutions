function square_root(n)
    i = 1
    while true
        if (i + 1) ^ 2 > n
            return i
        end
        i += 1
    end
end
