function encode(s)
    ans = ""
    for m in eachmatch(r"(.)\1*", s)
        if length(m.match) > 1
            ans *= string(length(m.match), m.captures[1])
        else
            ans *= m.captures[1]
        end
    end
    ans
end



function decode(s)
    ans = ""
    for m in eachmatch(r"\d*[A-Za-z\s]", s)
        n = length(m.match) == 1 ? 1 : parse(Int, m.match[1:end-1])
        c = m.match[end]
        ans *= repeat(c, n)
    end
    ans
end
