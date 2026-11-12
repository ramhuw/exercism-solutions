//Solution goes in Sources
public class BinarySearchTree {
    public var data: Int
    public var left: BinarySearchTree? = nil
    public var right: BinarySearchTree? = nil
    init(_ value: Int) {
        self.data = value
    }
    public func insert(_ value: Int) {
        if self.data >= value {
            if self.left == nil {
                self.left = BinarySearchTree(value)
            } else {
                self.left!.insert(value)
            }
        } else  {
            if self.right == nil {
                self.right = BinarySearchTree(value)
            } else {
                self.right!.insert(value)
            }
        }
    }
    public func allData() -> [Int] {
        (self.left?.allData() ?? []) + [self.data] + (self.right?.allData() ?? [])
    }
}
