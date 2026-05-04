function time_to_mix_juice(juice)
    if juice == "Pure Strawberry Joy"
        return 0.5
    elseif juice == "Energizer" || juice == "Green Garden"
        return 1.5
    elseif juice == "Tropical Island"
        return 3
    elseif juice == "All or Nothing"
        return 5
    else
        return 2.5
    end
end

function wedges_from_lime(size)
    if size == "small"
        return 6
    elseif size == "medium"
        return 8
    elseif size == "large"
        return 10
    end
end

function limes_to_cut(needed, limes)
    cut = 0
    wedges = 0
    for lime in limes
        if wedges >= needed
            return cut
        end
        cut += 1
        wedges += wedges_from_lime(lime)
    end
    cut
end

function order_times(orders)
    [time_to_mix_juice(order) for order in orders]
end

function remaining_orders(time_left, orders)
    while time_left > 0 && !isempty(orders)
        order = popfirst!(orders)
        time_left -= time_to_mix_juice(order)
    end
    orders
end
