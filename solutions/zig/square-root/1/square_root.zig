pub fn squareRoot(radicand: usize) usize {
    var left: usize = 1;
    var right = radicand;
    while (left + 1 < right) {
        const middle = (left + right) / 2;
        if (middle * middle <= radicand) {
            left = middle;
        } else {
            right = middle;
        }
    }
    return left;
}
