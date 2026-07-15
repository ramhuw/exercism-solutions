// Take a look at the tests, you might have to change the function arguments

pub fn binarySearch(comptime T: type, target: T, items: []const T) ?usize {
    var left: usize = 0;
    var right = items.len;
    if (right == 0) {
        return null;
    }
    while (left + 1 < right) {
        const middle = (left + right) / 2;
        if (items[middle] <= target) {
            left = middle;
        } else {
            right = middle;
        }
    }
    return if (items[left] == target) left else null;
}
