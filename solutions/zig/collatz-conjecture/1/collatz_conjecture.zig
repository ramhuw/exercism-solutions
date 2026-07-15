// Please implement the `ComputationError.IllegalArgument` error.

pub const ComputationError = error{IllegalArgument};

pub fn steps(number: usize) anyerror!usize {
    if (number < 1) {
        return ComputationError.IllegalArgument;
    } else if (number == 1) {
        return 0;
    } else if (number % 2 == 0) {
        const prev = try steps(number / 2);
        return 1 + prev;
    } else {
        const prev = try steps(number * 3 + 1);
        return 1 + prev;
    }
}
