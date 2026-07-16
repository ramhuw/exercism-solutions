pub fn squareOfSum(number: usize) usize {
    var ans: usize = 0;
    for (1..number + 1) |i| {
        ans += i;
    }
    ans *= ans;
    return ans;
}

pub fn sumOfSquares(number: usize) usize {
    var ans: usize = 0;
    for (1..number + 1) |i| {
        ans += i * i;
    }
    return ans;
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}
