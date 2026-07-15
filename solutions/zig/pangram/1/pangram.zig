pub fn isPangram(str: []const u8) bool {
    for (0..26) |i| {
        var flag = false;
        for (str) |c| {
            if (c == 'a' + i or c == 'A' + i) {
                flag = true;
                break;
            }
        }
        if (!flag) {
            return false;
        }
    }
    return true;
}
