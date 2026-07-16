pub const Classification = enum {
    deficient,
    perfect,
    abundant,
};
const std = @import("std");
/// Asserts that `n` is nonzero.
pub fn classify(n: u64) Classification {
    std.debug.assert(n != 0);
    var s: u64 = 0;
    var i: u64 = 1;
    while (i * i < n) : (i += 1) {
        if (n % i == 0) {
            s += i + n / i;
        }
    }
    if (i * i == n) {
        s += i;
    }
    s -= n;
    if (s == n) {
        return Classification.perfect;
    } else if (s < n) {
        return Classification.deficient;
    } else {
        return Classification.abundant;
    }
}
