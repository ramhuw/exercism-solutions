function create_inventory(items)
    inv = Dict{String,Int}()
    for i in items
        if haskey(inv, i)
            inv[i] += 1
        else
            inv[i] = 1
        end
    end
    inv
end

function add_items(inventory, items)
    for i in items
        if haskey(inventory, i)
            inventory[i] += 1
        else
            inventory[i] = 1
        end
    end
    inventory
end

function decrement_items(inventory, items)
    for i in items
        if haskey(inventory, i) && inventory[i] > 0
            inventory[i] -= 1
        end
    end
    inventory
end

function remove_item(inventory, item)
    if haskey(inventory, item)
        delete!(inventory, item)
    end
    inventory
end

function list_inventory(inventory)
    ans = []
    for (k, v) in inventory
        if v > 0
            push!(ans, Pair(k, v))
        end
    end
    sort(ans, by=p -> p.first)
end
