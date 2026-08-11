function square_root(n)
    left = 1
    right = n
    while left < right
        middle = (left + right + 1) ÷ 2
        sq = middle * middle
        if sq <= n && sq != 0
            left = middle
        else
            right = middle - 1
        end
    end
    left
end
