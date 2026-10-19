enum Classification {
    case equal, sublist, superlist, unequal
}

func isSublist(_ listOne: [Int], _ listTwo: [Int]) -> Bool {
    if listOne.count > listTwo.count {
        return false
    } else if listOne == Array(listTwo[..<listOne.count]) {
        return true
    } else {
        return isSublist(listOne, Array(listTwo[1...]))
    }
}

func classifier(listOne: [Int], listTwo: [Int]) -> Classification {
    let a = listOne.count
    let b = listTwo.count
    if a == b && isSublist(listOne, listTwo) {
        return .equal
    } else if a < b && isSublist(listOne, listTwo) {
        return .sublist
    } else if a > b && isSublist(listTwo, listOne) {
        return .superlist
    } else {
        return .unequal
    }
}
