// // Write your code for the 'Flatten-Array' exercise in this file.
func flattenArray(_ list: [Any]) -> [Int] {
    var ans: [Int] = []
    for l in list {
        if let x = l as? Int {
            ans.append(x)
        } else if let x = l as? [Any] {
            ans += flattenArray(x)
        }
    }
    return ans
}
