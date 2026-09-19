pub fn twoFer(buffer: []u8, name: ?[]const u8) ![]u8 {
    const n = name orelse "you";

    @memcpy(buffer[0..8], "One for ");
    @memcpy(buffer[8..(8 + n.len)], n);
    @memcpy(buffer[(8 + n.len)..(8 + n.len + 13)], ", one for me.");
    return buffer[0 .. 21 + n.len];
}
