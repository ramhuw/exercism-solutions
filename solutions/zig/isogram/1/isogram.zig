const std = @import("std");

pub fn isIsogram(str: []const u8) bool {
    for (0..str.len) |i| {
        if (std.ascii.isAlphabetic(str[i]) and i > 0) {
            for (0..i) |j| {
                if (std.ascii.toLower(str[i]) == std.ascii.toLower(str[j])) {
                    return false;
                }
            }
        }
    }
    return true;
}
