pub const Coordinate = struct {
    // This struct, as well as its fields and methods, needs to be implemented.

    r2: f32,

    pub fn init(x: f32, y: f32) Coordinate {
        return Coordinate{ .r2 = x * x + y * y };
    }
    pub fn score(self: Coordinate) usize {
        if (self.r2 > 100) {
            return 0;
        } else if (self.r2 > 25) {
            return 1;
        } else if (self.r2 > 1) {
            return 5;
        } else {
            return 10;
        }
    }
};
