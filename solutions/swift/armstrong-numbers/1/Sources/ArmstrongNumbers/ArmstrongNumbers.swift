import Foundation

func isArmstrongNumber(_ number: Int) -> Bool {
    var x = number
    let n = String(number).count
    var ans = 0
    while x != 0 {
        ans += Int(pow(Double(x % 10), Double(n)))
        x /= 10
    }
    return ans == number
}
