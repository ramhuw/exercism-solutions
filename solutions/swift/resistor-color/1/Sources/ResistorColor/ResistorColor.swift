import Foundation

enum ResistorColor: String, CaseIterable {
    case black = "black"
    case brown = "brown"
    case red = "red"
    case orange = "orange"
    case yellow = "yellow"
    case green = "green"
    case blue = "blue"
    case violet = "violet"
    case grey = "grey"
    case white = "white"
    static func colorCode(for: String) throws -> Int {
        guard let color = ResistorColor(rawValue: `for`) else {
            throw DomainError.OutOfRangeError
        }
        return Self.allCases.firstIndex(of: color)!
    }
    static var colors: [String] {
        return Self.allCases.map { $0.rawValue }
    }
}

enum DomainError: Error {
    case OutOfRangeError
}
