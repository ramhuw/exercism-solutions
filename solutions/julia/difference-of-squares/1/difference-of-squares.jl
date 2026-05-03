"Square the sum of the first `n` positive integers"
function square_of_sum(n)
    sum(x for x in 0:n)^2
end

"Sum the squares of the first `n` positive integers"
function sum_of_squares(n)
    sum(x^2 for x in 0:n)
end

"Subtract the sum of squares from square of the sum of the first `n` positive ints"
function difference(n)
    abs(sum_of_squares(n) - square_of_sum(n))
end
