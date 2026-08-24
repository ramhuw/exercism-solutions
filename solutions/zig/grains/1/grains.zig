pub const ChessboardError = error{IndexOutOfBounds};

pub fn square(index: usize) ChessboardError!u64 {
    if (index == 0 or index > 64) {
        return ChessboardError.IndexOutOfBounds;
    } else {
        const b: usize = 1;
        const p: u6 = @intCast(index - 1);
        const ans: usize = b << p;
        return ans;
    }
}

pub fn total() u64 {
    var ans: u64 = 0;
    for (1..65) |i| {
        const b: usize = 1;
        const p: u6 = @intCast(i - 1);
        ans += b << p;
    }
    return ans;
}
