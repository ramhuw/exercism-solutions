function eggcount(number)
    number == 0 && return 0
    (number & 1) + eggcount(number >>> 1)
end
