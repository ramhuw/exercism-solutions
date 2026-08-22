const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    if (limit == 0) {
        return 0;
    }
    const table = try allocator.alloc(bool, limit - 1);
    defer allocator.free(table);
    for (0..(limit - 1)) |i| {
        table[i] = true;
    }
    for (factors) |f| {
        if (f != 0) {
            var d = f;
            while (d <= limit - 1) {
                table[d - 1] = false;
                d += f;
            }
        }
    }
    var ans: u64 = 0;
    for (0..(limit - 1)) |i| {
        if (!table[i]) {
            ans += @intCast(i + 1);
        }
    }
    return ans;
}
