function isarmstrong(n)
    ns = map(x -> parse(Int, string(x)), collect(string(n)))
    l = length(ns)
    sum(a -> a ^ l, ns) == n
end
