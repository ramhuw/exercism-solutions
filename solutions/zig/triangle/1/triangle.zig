pub const TriangleError = error{Invalid};

pub const Triangle = struct {
    // This struct, as well as its fields and methods, needs to be implemented.

    a: f64,
    b: f64,
    c: f64,

    pub fn init(a: f64, b: f64, c: f64) TriangleError!Triangle {
        if (a > 0 and b > 0 and c > 0 and a + b > c and a + c > b and b + c > a) {
            return Triangle{ .a = a, .b = b, .c = c };
        } else {
            return TriangleError.Invalid;
        }
    }

    pub fn isEquilateral(self: Triangle) bool {
        return self.a == self.b and self.a == self.c;
    }

    pub fn isIsosceles(self: Triangle) bool {
        return self.a == self.b or self.a == self.c or self.b == self.c;
    }

    pub fn isScalene(self: Triangle) bool {
        return !self.isIsosceles();
    }
};
