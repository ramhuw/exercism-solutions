function score(x, y)
    r = x^2 + y^2
    if r > 100
        return 0
    elseif r > 25
        return 1
    elseif r > 1
        return 5
    else
        return 10
    end
end
