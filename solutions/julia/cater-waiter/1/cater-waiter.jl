function clean_ingredients(dish_name, dish_ingredients)
    (dish_name, Set(dish_ingredients))
end

function check_drinks(drink_name, drink_ingredients)
    tail = length(ALCOHOLS ∩ Set(drink_ingredients)) == 0 ? " Mocktail" : " Cocktail"
    drink_name * tail
end

function categorize_dish(dish_name, dish_ingredients)
    tail = ""
    if dish_ingredients ⊆ VEGAN
        tail = ": VEGAN"
    elseif dish_ingredients ⊆ VEGETARIAN
        tail = ": VEGETARIAN"
    elseif dish_ingredients ⊆ PALEO
        tail = ": PALEO"
    elseif dish_ingredients ⊆ KETO
        tail = ": KETO"
    elseif dish_ingredients ⊆ OMNIVORE
        tail = ": OMNIVORE"
    end
    dish_name * tail
end

function tag_special_ingredients(dish)
    s = Set()
    for i in dish[2]
        if i in SPECIAL_INGREDIENTS
            push!(s, i)
        end
    end
    (dish[1], s)
end

function compile_ingredients(dishes)
    s = Set()
    for dish in dishes
        s = s ∪ dish
    end
    s
end

function separate_appetizers(dishes, appetizers)
    collect(setdiff(Set(dishes), Set(appetizers)))
end

function singleton_ingredients(dishes, intersection)
    ans = Set()
    for dish in dishes
        for ing in dish
            if !(ing ∈ intersection)
                push!(ans, ing)
            end
        end
    end
    ans
end
