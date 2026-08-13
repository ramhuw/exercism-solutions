# Define the pythagorean_triplets(N) function
function pythagorean_triplets(n)
    ans = []
    for a in 1:n
        if 3 * a > n
            break
        end
        for b in (a+1):n
            if a + 2 * b > n
                break
            end
            if a^2 + b^2 == (n - a - b)^2
                push!(ans, (a, b, n-a-b))
            end
        end
    end
    ans
end