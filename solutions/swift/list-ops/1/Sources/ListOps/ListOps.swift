//Solution goes in Sources
class ListOps {
    static func append<T>(_ a: [T], _ b: [T]) -> [T] {
        return a + b
    }
    static func concat<T>(_ a: [[T]]) -> [T] {
        var ans: [T] = []
        for x in a {
            ans += x
        }
        return ans
    }
    static func filter<T>(_ a: [T], _ f: (T) -> Bool) -> [T] {
        var ans: [T] = []
        for x in a {
            if f(x) {
                ans.append(x)
            }
        }
        return ans
    }
    static func map<T, S>(_ a: [T], _ f: (T) -> S) -> [S] {
        var ans: [S] = []
        for x in a {
            ans.append(f(x))
        }
        return ans
    }
    static func length<T>(_ a: [T]) -> Int {
        var ans = 0
        for _ in a {
            ans += 1
        }
        return ans
    }
    static func foldLeft<T, S>(_ a: [T], accumulated: S, f: (T, S) -> S) -> S {
        var ans = accumulated
        for x in a {
            ans = f(x, ans)
        }
        return ans
    }
    static func foldRight<T, S>(_ a: [T], accumulated: S, f: (T, S) -> S) -> S {
        var ans = accumulated
        for x in a.reversed() {
            ans = f(x, ans)
        }
        return ans
    }
    static func reverse<T>(_ a: [T]) -> [T] {
        return a.reversed()
    }
}
