function score(str)
    foldl((acc, a) -> acc + t(a), str; init=0)
end

function t(c::Char)
    s = uppercase(c)
    if s in "A, E, I, O, U, L, N, R, S, T"
        return 1
    elseif s in "D, G"
        return 2
    elseif s in "B, C, M, P"
        return 3
    elseif s in "F, H, V, W, Y"
        return 4
    elseif s in "K"
        return 5
    elseif s in "J, X"
        return 8
    elseif s in "Q, Z"
        return 10
    else 
        return 0
    end
end