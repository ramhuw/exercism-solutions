pub fn convert(buffer: []u8, n: u32) []const u8 {
    var i: usize = 0;
    const pi: []const u8 = "Pling";
    const pa: []const u8 = "Plang";
    const po: []const u8 = "Plong";
    if (n % 3 == 0) {
        for (pi) |c| {
            buffer[i] = c;
            i += 1;
        }
    }
    if (n % 5 == 0) {
        for (pa) |c| {
            buffer[i] = c;
            i += 1;
        }
    }
    if (n % 7 == 0) {
        for (po) |c| {
            buffer[i] = c;
            i += 1;
        }
    }
    if (n % 3 != 0 and n % 5 != 0 and n % 7 != 0) {
        var m = n;
        while (m != 0) {
            const digit: u8 = @intCast(m % 10);
            buffer[i] = '0' + digit;
            m /= 10;
            i += 1;
        }
        for (0..(i / 2)) |j| {
            const temp = buffer[j];
            buffer[j] = buffer[i - 1 - j];
            buffer[i - 1 - j] = temp;
        }
    }
    const ans = buffer[0..i];
    return ans;
}
