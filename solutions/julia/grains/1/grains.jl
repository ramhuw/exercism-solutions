"""Calculate the number of grains on square `square`."""
function on_square(square)
    square <= 0 || square > 64 && throw(DomainError(square))
    big(2)^(square-1)
end

"""Calculate the total number of grains after square `square`."""
function total_after(square)
    (square <= 0 || square > 64) && throw(DomainError(square))
    ans = big(0)
    p = big(1)
    for _ in 1:square
        ans += p
        p *= big(2)
    end
    ans
end
