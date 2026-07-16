pub fn primes(buffer: []u32, comptime limit: u12) []u32 {
    var table: [limit + 1]bool = [_]bool{true} ** (limit + 1);
    table[0] = false;
    table[1] = false;
    var j: usize = 0;
    for (2..(limit + 1)) |i| {
        if (table[i]) {
            buffer[j] = @intCast(i);
            j += 1;
            for (2..(limit + 1)) |k| {
                if (i * k > limit) {
                    break;
                }
                table[i * k] = false;
            }
        }
    }
    return buffer[0..j];
}
