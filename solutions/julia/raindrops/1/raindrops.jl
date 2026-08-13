function raindrops(number)
    a = number % 3 == 0 ? "Pling" : ""
    b = number % 5 == 0 ? "Plang" : ""
    c = number % 7 == 0 ? "Plong" : ""
    ans = a * b * c
    isempty(ans) ? string(number) : ans
end
