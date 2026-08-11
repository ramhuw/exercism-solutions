function all_15(ratings)
    all(x -> x == 1 || x == 5, ratings)
end

function emphatics(customers)
    filter(x -> all_15(x.second), customers)
end

function tobinary(ratings)
    map(x -> x == 5 ? 1 : 0, ratings)
end

function tobinarymatrix(ratings)
    permutedims(hcat(map(tobinary, ratings)...))
end
