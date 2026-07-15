const std = @import("std");
const mem = std.mem;

pub fn prime(allocator: mem.Allocator, number: usize) !usize {
    const primes = try allocator.alloc(usize, number);
    var i: usize = 2;
    for (primes, 0..) |*p, j| {
        var prime_found = false;
        while (!prime_found) {
            var divisor_found = false;
            for (0..j) |k| {
                if (i % primes[k] == 0) {
                    divisor_found = true;
                    break;
                }
            }
            if (!divisor_found) {
                prime_found = true;
            } else {
                i += 1;
            }
        }
        p.* = i;
        i += 1;
    }
    defer allocator.free(primes);
    return primes[number - 1];
}
