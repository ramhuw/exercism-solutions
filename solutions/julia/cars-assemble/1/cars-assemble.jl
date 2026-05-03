function success_rate(speed)
    if speed == 0
        0
    elseif 1 <= speed <= 4
        1
    elseif 5 <= speed <= 8
        0.9
    elseif speed == 9
        0.8
    else
        0.77
    end
end

function production_rate_per_hour(speed)
    speed * 221 * success_rate(speed)
end

function working_items_per_minute(speed)
    Int(div(production_rate_per_hour(speed), 60))
end
