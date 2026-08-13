function additems!(cart, items)
    for item in items
        cart[item] = get(cart, item, 0) + 1
    end
    cart
end

function update_recipes!(ideas, updates)
    for update in updates
        ideas[update.first] = update.second
    end
    ideas
end

function send_to_store(cart, aislecodes)
    sort([aislecodes[item] => quantity for (item, quantity) in cart]; by=first)
end

function update_store_inventory!(inventory, cart)
    out = Dict()
    for (item, quantity) in cart
        s = get(inventory, item, 0)
        if s <= quantity
            inventory[item] = 0
            out[item] = 0
        else
            inventory[item] = s - quantity
        end
    end
    out
end

function reorder!(outofstock, stock)
    for (item, _) in outofstock
        if !haskey(stock, item)
            stock[item] = 100
        end
        outofstock[item] = get(stock, item, 100)
    end
    outofstock
end
