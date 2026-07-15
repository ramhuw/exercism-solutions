const std = @import("std");
const mem = std.mem;

pub fn factors(allocator: mem.Allocator, value: u64) mem.Allocator.Error![]u64 {
    if (value <= 1) {
        return allocator.alloc(u64, 0);
    }
    const prime_factors = try allocator.alloc(u64, 63);
    errdefer allocator.free(prime_factors);
    var v = value;
    var prime: u64 = 2;
    var len: usize = 0;
    for (prime_factors) |*p| {
        if (v == 1) {
            break;
        }

        while (v % prime != 0) {
            prime += 1;
            if (prime * prime > v) {
                prime = v;
            }
        }
        p.* = prime;
        v /= prime;
        len += 1;
    }
    const ans = try allocator.realloc(prime_factors, len);
    return ans;
}
