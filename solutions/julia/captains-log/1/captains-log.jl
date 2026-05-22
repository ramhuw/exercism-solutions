function random_planet()
    rand(['D', 'H', 'J', 'K', 'L', 'M', 'N', 'R', 'T', 'Y'])
end

function random_ship_registry_number()
    "NCC-" * string(rand(1000:9999))
end

function random_stardate()
    (rand() * 1000) + 41000
end

function random_stardate_v2()
    round(random_stardate(), digits=1)
end

function pick_starships(starships, number_needed)
    shuffle(starships)[1:number_needed]
end
