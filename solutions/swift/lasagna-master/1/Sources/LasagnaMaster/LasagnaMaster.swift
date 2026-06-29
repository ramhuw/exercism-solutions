// TODO: define the 'remainingMinutesInOven' function
func remainingMinutesInOven(elapsedMinutes: Int, expectedMinutesInOven: Int = 40) -> Int {
    return expectedMinutesInOven - elapsedMinutes
}
// TODO: define the 'preparationTimeInMinutes' function
func preparationTimeInMinutes(layers: String...) -> Int {
    return layers.reduce(0) {
        acc, _ in acc + 2
    }
}
// TODO: define the 'quantities' function
func quantities(layers: String...) -> (noodles: Int, sauce: Double) {
    let a1 = 3 * layers.count {
        s in s == "noodles"
    }
    let a2: Double = 0.2 * Double(layers.count {
        s in s == "sauce"
    })
    return (noodles: a1, sauce: a2)
}

// TODO: define the 'toOz' function
func toOz(_ amount: inout(noodles: Int, sauce: Double)) {
    amount.sauce *= 33.814
}

// TODO: define the 'redWine' function
func redWine(layers: String...) -> Bool {
    let a1 = layers.count {
        l in
        l == "mozzarella" || l == "ricotta" ||
        l == "béchamel"
    }
    let a2 = layers.count {
        l in l == 
        "meat" || l == "sauce"
    }
    return a1 <= a2
}