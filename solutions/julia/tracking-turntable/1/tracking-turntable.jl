function z(x, y)
    x + y * im
end

function euler(r, θ)
    r * (cos(θ) + im * sin(θ))
end

function rotate(x, y, θ)
    reim(z(x, y) * euler(1, θ))
end

function rdisplace(x, y, r)
    z(x, y) + euler(r, angle(z(x, y))) |> reim
end

function findsong(x, y, r, θ)
    rr = rotate(x, y, θ)
    rdisplace(rr[1], rr[2], r)
end
