/// Writes a reversed copy of `s` to `buffer`.
pub fn reverse(buffer: []u8, s: []const u8) []u8 {
    const l: usize = s.len;
    for (s, 0..) |x, i| {
        buffer[l - i - 1] = x;
    }
    return buffer[0..l];
}
