function exchange_money(budget, exchange_rate)
    budget / exchange_rate
end

function get_change(budget, exchanging_value)
    budget - exchanging_value
end

function get_value_of_bills(denomination, number_of_bills)
    denomination * number_of_bills
end

function get_number_of_bills(amount, denomination)
    div(amount, denomination)
end

function get_leftover_of_bills(amount, denomination)
    amount - get_number_of_bills(amount, denomination) * denomination
end

function exchangeable_value(budget, exchange_rate, spread, denomination)
    div(div(budget, (exchange_rate * (1 + spread / 100))), denomination) * denomination
end
